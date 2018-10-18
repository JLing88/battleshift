module Api
  module V1
    module Games
      class ShotsController < ApiController
        def create
          @game = Game.find(params[:game_id])

          if valid_turn?
            turn_processor = TurnProcessor.new(@game, params[:shot][:target])
            turn_processor.run!
            render json: @game, message: turn_processor.message
          else
            render json: @game, message: "Invalid move. It's your opponent's turn", status: 400
          end
        end

        private
          def valid_turn?
            player_1_move? || player_2_move?
          end

          def player_1_move?
            request_player.id == @game.player_1_id && @game[:current_turn] == "player_1"
          end

          def player_2_move?
            request_player.id == @game.player_2_id && @game[:current_turn] == "player_2"
          end

          def request_player
            User.find_by(api_key: request.headers["HTTP_X_API_KEY"])
          end
      end
    end
  end
end
