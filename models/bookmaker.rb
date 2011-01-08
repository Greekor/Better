#
# This class represents a bookmaker.
#
# === Attributes
# * bookie_games
# * teamnames     => contains all teamnames of this bookmaker and their mappings
# * betnames      => contains all betnames of this bookmaker and their mappings
# * name
# * created_at
# * updated_at
#

class Bookmaker < ActiveRecord::Base
  has_many :bookie_games 
  has_many :teamnames
  has_many :betnames
  
  def to_s
    self.name
  end
end