class Bookmaker < ActiveRecord::Base
  has_many :bookie_games 
  has_many :teamnames
  has_many :betnames
end