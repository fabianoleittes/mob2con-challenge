# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'RetailChain API', type: :request do
  describe 'POST /v1/retail_chains' do
    context 'as an unauthorized user' do
      before do
        post(
          '/v1/retail_chains',
          params: retail_chains_params.to_json,
          headers: headers
        )
      end

      it 'returns a 403 response' do
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  def retail_chains_params
    attributes_for(:retail_chain)
  end
end
