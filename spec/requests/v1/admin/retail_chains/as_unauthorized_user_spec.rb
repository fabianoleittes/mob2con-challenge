# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'RetailChain API', type: :request do
  describe 'POST /v1/admin/retail_chains' do
    context 'with an unauthorized user' do
      before do
        post(
          '/v1/admin/retail_chains',
          params: retail_chains_params.to_json,
          headers: valid_headers
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
