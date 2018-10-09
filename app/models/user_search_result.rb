class UserSearchResult
  attr_reader :name,
              :email

  def initialize(attributes = {})
    @name = attributes[:name]
    @email = attributes[:email]
  end
end
