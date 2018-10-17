class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # helper_method :current_player
  #
  # def current_player
  #   @current_player ||= User.find_by(api_key: request.headers["HTTP-X-API-KEY"])
  # end

end
