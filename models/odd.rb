#
# This class represents the odds of one betname and game
#
# === Attributes
# * bookie_game
# * bet           => Betname
# * betname (String)
# * odd1
# * oddX
# * odd2
# * created_at
# * updated_at
#

class Odd < ActiveRecord::Base
  belongs_to :bookie_game
  belongs_to :bet, :class_name => "Betname", :foreign_key => "bet_id"
  
  before_save :map
  
  def Odd.convert(odd)
    # US-Odds >= 100 or <= -100
    if odd.class == Fixnum and odd >= 100
      odd = 1.0 + odd/100.0
    end
    if odd.class == Fixnum and odd <= -100
      odd = 1.0 - 100.0/odd
    end
    
    odd.round(2)
  end
  
  def odd1=(odd)
    self.odd1 = Odd.convert(odd)
  end
  
  def oddX=(odd)
    self.oddX = Odd.convert(odd)
  end
  
  def odd2=(odd)
    self.odd2 = Odd.convert(odd2)
  end
  
  private
    # uses betname class to figure out the betname this odd belongs to
    def map(force = false)
      if force || self.bet.nil?
        # lookup bet in betname class
        # if already there, get instance
        # otherwise create and save new instance
        bet = Betname.find_or_create_by_name(self.betname)
        
        begin
          bet.bookmaker = self.bookie_game.bookmaker
          bet.save
        end if bet.bookmaker.nil?
              
        # map to this betname
        begin
          self.bet = bet.bet
        end unless bet.bet.nil?
      end 
    end    
end