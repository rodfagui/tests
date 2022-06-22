module ApiHelper
  def authenticated_header(user)
    token = JsonWebToken.encode(user_id: user.id)
    {
      'Authorization' => token.to_s,
      'Content_Type' => 'application/json'
    }
  end

  def invalid_headers
    {
      'Authorization' => nil,
      'Content_Type' => 'application/json'
    }
  end

  def json
    JSON.parse(response.body)
  end
end

RSpec.configure do |config|
  config.include ApiHelper
end
