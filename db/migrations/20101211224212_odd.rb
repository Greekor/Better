class Odd < ActiveRecord::Migration
  def self.up
    create_table :odds do |t|
      t.references :bookie_game
      t.references :bet
      
      t.string :betname
      t.decimal :odd1, :oddX, :odd2, { :scale => 2, :precision => 3 }
      
      t.timestamps
    end
  end

  def self.down
    drop_table :odds
  end
end
