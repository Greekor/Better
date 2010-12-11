class Game < ActiveRecord::Base
  has_many :bookie_games
  has_many :odds, :through => :bookie_games
end