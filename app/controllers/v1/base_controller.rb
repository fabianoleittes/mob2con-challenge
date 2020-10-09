module V1
  class BaseController < ApplicationController
    include Response
    include ExceptionHandler

    before_action :authorize_request
    attr_reader :current_user

    private

    def authorize_request
      @current_user = Authorize.call(request.headers)
    end
  end
end