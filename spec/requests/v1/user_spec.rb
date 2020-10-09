# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  describe 'POST /v1/signup' do
    context 'with valid data' do
      before do
        post(
          '/v1/signup',
          params: user_params.to_json,
          headers: { 'Content-Type' => 'application/json' }
        )
      end

      it 'returns a 201 response' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid data' do
      before do
        post(
          '/v1/signup',
          params: {},
          headers: { 'Content-Type' => 'application/json' }
        )
      end

      it 'returns a 422 response' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  def user_params
    attributes_for(:user)
  end
end
