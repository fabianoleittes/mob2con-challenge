# frozen_string_literal: true

class Authenticator
  def initialize(email:, password:)
    @email = email
    @password = password
  end

  def self.call(email, password)
    new(email: email, password: password).call
  end

  def call(adapter = JsonWebTokenAdapter)
    adapter.encode(user_id: user.id) if user
  end

  private

  def user(user_repo = User)
    user = user_repo.find_by(email: email)

    return user if user&.authenticate(password)

    raise(ExceptionHandler::AuthenticatorError, Message.invalid_credentials)
  end

  attr_reader :email, :password
end
