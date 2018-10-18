module Api
  module V1
    module Games
      class ShipsController < ApiController

        def create
          ship = Ship.new(params[:ship_size])
          user = User.find_by(api_key: request.headers["HTTP_X_API_KEY"])
          game = Game.find(params[:game_id].to_i)

          if user.id == game.player_1_id
            board = game.player_1_board
          else
            board = game.player_2_board
          end

          ShipPlacer.new(
          board: board,
          ship: ship,
          start_space: params[:start_space],
          end_space: params[:end_space]).run

          game.increment_ship_spots(ship.length, user)

          if game.player_1_ship_spots == 2 ||  game.player_1_ship_spots == 3
            message = "Successfully placed ship with a size of #{ship.length}. You have 1 ship(s) to place with a size of #{5 - ship.length}."
          elsif game.player_2_ship_spots == 2 ||  game.player_2_ship_spots == 3
            message = "Successfully placed ship with a size of #{ship.length}. You have 1 ship(s) to place with a size of #{5 - ship.length}."
          else
            message =  "Successfully placed ship with a size of #{ship.length}. You have 0 ship(s) to place."
          end

          game.save

          render json: game, message: message
        end
      end
    end
  end
end
