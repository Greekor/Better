class BookieGame < ActiveRecord::Base
  belongs_to :bookmaker, :game
  has_many :odds
end