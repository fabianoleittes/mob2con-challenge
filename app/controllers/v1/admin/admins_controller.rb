# frozen_string_literal: true

module V1
  module Admin
    class AdminsController < ApplicationController
      before_action :authorize_request, :require_be_admin
      def logged_as_admin?
        current_user.admin?
      end

      def require_be_admin
        raise NotPermittedException unless logged_as_admin?
      end
    end
  end
end
