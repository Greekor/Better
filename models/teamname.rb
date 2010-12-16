class Teamname < ActiveRecord::Base
  belongs_to :bookmaker
  belongs_to :team, :class_name => "Teamname", :foreign_key => "teamname_id"
  has_one :teamname
  
  # returns all unmapped Teamnames
  def self.unmapped
    self.find(:all, :conditions => { :teamname_id => nil })
  end
end