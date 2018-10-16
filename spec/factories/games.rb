FactoryBot.define do
  factory :game do
    player_1_board "You should add a board object"
    player_2_board "You should add a board object"
    winner nil
    player_1_turns 0
    player_2_turns 0
    current_turn "player_1"
  end
end
