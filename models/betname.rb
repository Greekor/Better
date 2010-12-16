class Betname < ActiveRecord::Base
  belongs_to :bookmaker
  belongs_to :bet, :class_name => "Betname", :foreign_key => "betname_id"
  has_many :odds
  has_one :betname
  
  # returns all unmapped Betnames
  def self.unmapped
    self.find(:all, :conditions => { :betname_id => nil })
  end
end