class UserFacade

  def initialize(id)
    @id = id
  end

  def user
      # this returns the parsed response (hash)
    user ||= User.new(service.user_search)
  end

    private

      def service
        UserService.new(@id)
      end
end
