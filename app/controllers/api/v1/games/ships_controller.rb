module Api
  module V1
    module Games
      class ShipsController < ApiController

        def create
          ship = Ship.new(params[:ship_size])

          game = Game.find(params[:game_id].to_i)
          if game.current_turn == "player_1"
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

          if game.player_1_ship_spots == 2 || 3
            ship_left = 1
          elsif game.player_2_ship_spots == 2 || 3
            ship_left = 1
          else
            ship_left = 0
          end

          if ship_left == 0
            message =  "Successfully placed ship with a size of #{ship.length}. You have #{ship_left} ship(s) to place."
          else
            message = "Successfully placed ship with a size of #{ship.length}. You have #{ship_left} ship(s) to place with a size of #{5 - ship.length}."
          end

          render json: game, message: message
        end
      end
    end
  end
end
