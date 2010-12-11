class Teamname < ActiveRecord::Migration
  def self.up
    create_table :teamnames do |t|
      t.references :bookmaker, :teamname
      
      t.string :name
      
      t.timestamps
    end
  end

  def self.down
    drop_table :teamnames
  end
end
