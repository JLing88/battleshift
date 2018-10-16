class Game < ApplicationRecord
  attr_accessor :messages

  enum current_turn: ["player_1", "player_2"]
  serialize :player_1_board
  serialize :player_2_board

  validates :player_1_board, presence: true
  validates :player_2_board, presence: true

  def increment_ship_spots(ship_length)
    if self.current_turn == "player_1"
      self.player_1_ship_spots += ship_length
    else
      self.player_2_ship_spots += ship_length
    end
  end
end
