player_1_board = Board.new(4)
player_2_board = Board.new(4)

sm_ship = Ship.new(2)
md_ship = Ship.new(3)

# Place Player 1 ships
ShipPlacer.new(board: player_1_board,
               ship: sm_ship,
               start_space: "A1",
               end_space: "A2").run

ShipPlacer.new(board: player_1_board,
               ship: md_ship,
               start_space: "B1",
               end_space: "D1").run

# Place Player 2 ships
ShipPlacer.new(board: player_2_board,
               ship: sm_ship.dup,
               start_space: "A1",
               end_space: "A2").run

ShipPlacer.new(board: player_2_board,
               ship: md_ship.dup,
               start_space: "B1",
               end_space: "D1").run

   user_1 = User.create!(name: "Josiah Bartlet", email: "jbartlet@example.com", address: "1600 Pennsylvania Ave NW, Washington, DC 20500", password: "1234", api_key: "hU9LgAODd6gq6BIhratwwg")

    user_2 = User.create!(name: "Jesse", email: "jrl8888@gmail.com", address: "123 Main St. Boone, OK 12345", password: "test", api_key: "3ORR4fwdSh9HkpzdMCG6vA")

game_attributes = {
  player_1_board: player_1_board,
  player_2_board: player_2_board,
  player_1_turns: 0,
  player_2_turns: 0,
  current_turn: "player_1",
  player_1_id: user_1.id,
  player_2_id: user_2.id
}

game = Game.new(game_attributes)
game.save!
