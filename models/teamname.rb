class Teamname < ActiveRecord::Base
  belongs_to :bookmaker, :teamname
  has_one :teamname
end