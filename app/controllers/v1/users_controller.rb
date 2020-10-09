module V1
  class UsersController < BaseController
    def create
      @user = User.new(user_params)

      if @user.save
        json_response(@user, :created)
      else
        json_response(@user.errors, :unprocessable_entity)
      end
    end

    private

    def user_params
      params.permit(
        :name,
        :email,
        :password,
        :password_confirmation
      )
    end
  end
end
