# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  attr_reader :current_user

  private

  def authorize_request
    @current_user = Authorize.call(request.headers)
  end
end
