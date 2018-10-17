module Api
  module V1
    class GamesController < ActionController::API
      def show
        if game = Game.find_by(id: params[:id])
          render json: game
        else
          render status: 400
        end
      end

      def create
        player_1_board = Board.new(4)
        player_2_board = Board.new(4)
        current_turn = "player_1"
        player_1 = User.find_by(api_key: request.headers["HTTP_X_API_KEY"])
        player_2 = User.find_by(email: params[:opponent_email])
        game_attributes = {
          player_1_board: player_1_board,
          player_2_board: player_2_board,
          player_1_turns: 0,
          player_2_turns: 0,
          player_1_id: player_1.id,
          player_2_id: player_2.id,
          current_turn: current_turn
       }
       game = Game.create(game_attributes)
       render json: game
      end
    end
  end
end
