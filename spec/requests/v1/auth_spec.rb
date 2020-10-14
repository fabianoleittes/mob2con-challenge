# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Auth', type: :request do
  describe 'POST /v1/auth/login' do
    let!(:user) { create(:user) }
    let(:headers) { valid_headers.except('Authorization') }

    context 'when a request is valid' do
      before do
        post(
          '/v1/auth/login',
          params: valid_credentials,
          headers: headers
        )
      end

      it 'returns an auth token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when a request is invalid' do
      before do
        post('/v1/auth/login',
             params: invalid_credentials,
             headers: headers)
      end

      it 'returns a failure message' do
        expect(json['message']).to match(/Invalid credentials/)
      end
    end
  end

  def valid_credentials
    {
      email: user.email,
      password: user.password
    }.to_json
  end

  def invalid_credentials
    {
      email: FFaker::Internet.email,
      password: FFaker::Internet.password
    }.to_json
  end
end
