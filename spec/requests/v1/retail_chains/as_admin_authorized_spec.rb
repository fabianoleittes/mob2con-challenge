# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'RetailChain API', type: :request do
  let!(:user) { create(:user, :be_admin) }

  describe 'POST /v1/retail_chains' do
    context 'with valid data' do
      before do
        post(
          '/v1/retail_chains',
          params: retail_chains_params.to_json,
          headers: headers
        )
      end

      it 'returns a 201 response' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid data' do
      before do
        post(
          '/v1/retail_chains',
          params: {},
          headers: headers
        )
      end

      it 'returns a 422 response' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /v1/retail_chains' do
    let!(:retail_chains) { create_list(:retail_chain, 5) }

    before do
      get(
        '/v1/retail_chains',
        params: {},
        headers: headers
      )
    end

    context 'when retail_chains exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns all retail_chains' do
        expect(json.size).to eq(5)
      end
    end
  end

  def retail_chains_params
    attributes_for(:retail_chain)
  end
end
