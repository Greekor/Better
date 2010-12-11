class Bookmaker < ActiveRecord::Base
  has_many :bookie_games, :teamnames, :betnames
end