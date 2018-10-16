module Api
  module V1
    module Games
      class ShipsController < ApiController

        def create
          ship = Ship.new(params[:ship_size])

          game = Game.find(params[:game_id].to_i)
          if request.headers["HTTP_X_API_KEY"] == game.player_1_api_key
            ShipPlacer.new(
              board: game.player_1_board,
              ship: ship,
              start_space: params[:start_space],
              end_space: params[:end_space]).run

          else
            ShipPlacer.new(
                board: game.player_2_board,
                ship: ship,
                start_space: params[:start_space],
                end_space: params[:end_space]).run
          end
          game.increment_ship_spots(ship.length)



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
