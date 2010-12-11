class Betname < ActiveRecord::Migration
  def self.up
    create_table :betnames do |t|
      t.references :bookmaker, :betname
      
      t.string :name
      
      t.timestamps
    end
  end

  def self.down
    drop_table :betnames
  end
end
