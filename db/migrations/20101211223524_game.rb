class Game < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.references :team1, :team2
      t.references :sport, :league
      
      t.datetime :time
      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
