class Betname < ActiveRecord::Base
  belongs_to :bookmaker, :betname
  has_one :betname
end