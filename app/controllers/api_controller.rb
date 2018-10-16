class ApiController < ActionController::API
  helper_method :current_player

  def current_player
    @current_player ||= User.find_by(api_key: request.headers["HTTP-X-API-KEY"])
  end

end
