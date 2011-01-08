#
# This class represents a sports game.
# Through this class, all important informations can be accessed
#
# === Attributes
# * bookie_games
# * odds
# * home
# * away
# * created_at
# * updated_at
#

class Game < ActiveRecord::Base
  has_many :bookie_games
  has_many :odds, :through => :bookie_games
  
  belongs_to :home, :class_name => "Teamname", :foreign_key => "team1_id"
  belongs_to :away, :class_name => "Teamname", :foreign_key => "team2_id"
  
  def odds_by_bet
    # Hash
    odds_by_betid = {}
    # get all odds
    self.odds.find(:all, :include => [:bet, { :bookie_game => :bookmaker }]).each do |odd|
      if (odds_by_betid.has_key? odd.bet.id)
        odds_by_betid[odd.bet.id][:odds].push({ :odd => odd, :bookmaker => odd.bookie_game.bookmaker})
      else
        odds_by_betid[odd.bet.id] = { :bet => odd.bet, :odds => [{ :odd => odd, :bookmaker => odd.bookie_game.bookmaker}] }
      end
    end

    odds_by_betid
  end
end