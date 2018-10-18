class Game < ApplicationRecord
  attr_accessor :messages

  belongs_to :user, foreign_key: :player_1_id
  belongs_to :user, foreign_key: :player_2_id

  enum current_turn: ["player_1", "player_2"]
  serialize :player_1_board
  serialize :player_2_board

  validates :player_1_board, presence: true
  validates :player_2_board, presence: true

  def increment_ship_spots(ship_length, player)
    if player.id == self.player_1_id
      self.player_1_ship_spots += ship_length
    elsif player.id == self.player_2_id
      self.player_2_ship_spots += ship_length
    end
    self.save
  end
end
