class Odd < ActiveRecord::Base
  belongs_to :bookie_game
  belongs_to :bet, :class_name => "Betname", :foreign_key => "bet_id"
  
  before_save :map
  
  private
    # uses betname class to figure out the betname this odd belongs to
    def map
      # lookup bet in betname class
      # if already there, get instance
      # otherwise create and save new instance
      bet = Betname.find_or_create_by_name(self.betname)
      
      begin
        bet.bookmaker = self.bookie_game.bookmaker
        bet.save
      end if bet.bookmaker.nil?
      
      
      
      # map to this betname
      self.bet = bet
    end
end