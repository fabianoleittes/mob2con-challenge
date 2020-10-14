# frozen_string_literal: true

module RequestHelper
  def json
    (reparse_and_never_memoize_as_response_may_change = lambda do
      JSON.parse(response.body)
    end).call
  end

  def user
    user ||= create(:user)
  end

  def token_generator(user_id, adapter = JsonWebTokenAdapter)
    adapter.encode(user_id: user_id)
  end

  def expired_token_generator(user_id, adapter = JsonWebTokenAdapter)
    adapter.encode({ user_id: user_id }, (Time.now.to_i - 10))
  end

  def valid_headers
    {
      'Authorization' => token_generator(user.id),
      'Content-Type' => 'application/json'
    }
  end

  def invalid_headers
    {
      'Authorization' => nil,
      'Content-Type' => 'application/json'
    }
  end
end

RSpec.configure do |config|
  config.include RequestHelper
end
