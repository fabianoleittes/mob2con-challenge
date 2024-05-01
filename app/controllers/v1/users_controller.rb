# frozen_string_literal: true

module V1
  class UsersController < BaseController
    def create
      @user = User.new(user_params)

      if @user.save
        respond_with_json(@user, :created)
      else
        respond_with_json(@user.errors, :unprocessable_entity)
      end
    end

    private

    def user_params
      params
        .require(:user)
        .permit(
          :name,
          :email,
          :password,
          :password_confirmation
        )
    end
  end
end
