# frozen_string_literal: true

require 'api_version'
Rails.application.routes.draw do
  scope defaults: { format: :json }, path: '/', constraints: { subdomain: 'api' } do
    namespace :v1, constraints: ApiVersion.new(version: 'v1', default: true) do
    end
  end
end
