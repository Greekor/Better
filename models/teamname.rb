#
# Mapping class for teamnames of different bookmakers
#
# === Attributes
# * bookmaker
# * team        => Teamname
# * teamname
# * name
# * created_at
# * updated_at
#

class Teamname < ActiveRecord::Base
  belongs_to :bookmaker
  belongs_to :team, :class_name => "Teamname", :foreign_key => "teamname_id"
  has_one :teamname
  
  # returns all unmapped Teamnames
  def Teamname.unmapped
    self.find(:all, :conditions => { :teamname_id => nil })
  end
  
  # maps Teamname to given teamname_id
  def map_to(id)
    self.team = Teamname.find(id)
  end
  
  def to_s
    self.name
  end
end