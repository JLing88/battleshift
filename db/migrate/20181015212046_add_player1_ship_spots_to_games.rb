class AddPlayer1ShipSpotsToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :player_1_ship_spots, :integer, default: 0
    add_column :games, :player_2_ship_spots, :integer, default: 0
  end
end
