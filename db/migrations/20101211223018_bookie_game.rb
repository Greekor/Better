class BookieGame < ActiveRecord::Migration
  def self.up
    create_table :bookie_games do |t|
      t.references :bookmaker, :game
      
      t.string :team1, :team2
      t.string :sport, :league
            
      t.timestamps
    end
  end

  def self.down
    drop_table :bookie_games
  end
end
