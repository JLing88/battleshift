class UsersController < ApplicationController
  def show
    @user = UserSearchResult.new
  end
end
