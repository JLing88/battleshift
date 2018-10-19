class AddGameOverToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :game_over, :boolean, default: false
  end
end
