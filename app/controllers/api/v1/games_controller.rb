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
        sm_ship = Ship.new(2)
        md_ship = Ship.new(3)
        current_turn = "player_1"


        game_attributes = {
          player_1_board: player_1_board,
          player_2_board: player_2_board,
          player_1_turns: 0,
          player_2_turns: 0,
          current_turn: "player_1"
       }
       game = Game.create(game_attributes)
       render json: game 
      end
    end
  end
end
