class UserSearchResult

  def user_info
    conn = Faraday.new(url: "http://localhost:3000") do |faraday|
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/api/v1/users/1")

    JSON.parse(response.body), symbolize_name: true)[]
  end
end
