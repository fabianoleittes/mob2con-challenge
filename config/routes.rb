# frozen_string_literal: true

require 'api_version'
Rails.application.routes.draw do
  scope defaults: { format: :json }, path: '/', constraints: { subdomain: 'api' } do
    namespace :v1, constraints: ApiVersion.new(version: 'v1', default: true) do
      namespace :admin do
        resources :retail_chains, only: %i[create index show update destroy] do
          resources :visitors, only: %i[create index show update destroy]
        end
      end
      resources :visitors, only: %i[] do
        resources :visits, only: %i[create update]
      end
      post 'signup', to: 'users#create'
      post 'auth/login', to: 'auth#authenticate'
    end
  end
end
