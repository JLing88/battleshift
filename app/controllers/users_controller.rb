class UsersController < ApplicationController
  def show
    id = params[:id]

    conn = Faraday.new(url: ENV["path"]) do |faraday|
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/api/v1/users/#{id}")

    user_response = JSON.parse(response.body, symbolize_names: true)

    @user = UserSearchResult.new(user_response)
  end
end
