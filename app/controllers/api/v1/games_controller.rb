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
      end
    end
  end
end
