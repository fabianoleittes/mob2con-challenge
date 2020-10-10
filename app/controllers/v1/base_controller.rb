# frozen_string_literal: true

module V1
  class BaseController < ApplicationController
    include Response
    include ExceptionHandler

    attr_reader :current_user

    private

    def authorize_request
      @current_user = Authorize.call(request.headers)
    end

    def logged_as_admin?
      current_user.admin?
    end

    def require_be_admin
      raise NotPermittedException unless logged_as_admin?
    end
  end
end
