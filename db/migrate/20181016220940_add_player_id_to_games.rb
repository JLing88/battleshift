class AddPlayerIdToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :player_1_id, :integer 
    add_column :games, :player_2_id, :integer
    add_foreign_key :games, :users, column: :player_1_id, index: true
    add_foreign_key :games, :users, column: :player_2_id, index: true
  end
end
