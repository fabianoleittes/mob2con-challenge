module RequestHelper
  def json
    (reparse_and_never_memoize_as_response_may_change = -> do
      JSON.parse(response.body)
    end).call
  end

  def headers
    {
      'Authorization' => token_generator(user.id),
      'Content-Type' => 'application/json'
    }
  end

  def user
    user ||= create(:user)
  end

  def token_generator(user_id, adapter = JsonWebTokenAdapter)
    adapter.encode(user_id: user_id)
  end
end

RSpec.configure do |config|
  config.include RequestHelper, type: :request
end
