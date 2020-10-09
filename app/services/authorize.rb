# frozen_string_literal: true

class Authorize
  def initialize(headers = {})
    @headers = headers
  end

  def self.call(headers)
    new(headers).call[:user]
  end

  def call
    {
      user: user
    }
  end

  private

  def user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
  rescue ActiveRecord::RecordNotFound => e
    raise(
      ExceptionHandler::InvalidToken,
      ("#{Message.invalid_token} #{e.message}")
    )
  end

  def decoded_auth_token(adapter = JsonWebTokenAdapter)
    @decoded_auth_token ||= adapter.decode(http_auth_header)
  end

  def http_auth_header
    return headers['Authorization'].split(' ').last if headers?

    raise(ExceptionHandler::MissingToken, Message.missing_token)
  end

  def headers?
    headers['Authorization'].present?
  end

  attr_reader :headers
end
