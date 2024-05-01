# frozen_string_literal: true

module V1
  class AuthController < BaseController
    def authenticate
      auth_token = Authenticator.call(
        auth_params[:email],
        auth_params[:password]
      )
      json_response(auth_token: auth_token)
    end

    private

    def auth_params
      params.require(:user).permit(:email, :password)
    end
  end
end
