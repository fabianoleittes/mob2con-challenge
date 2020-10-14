# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Visitors API', type: :request do
  let(:retail_chain) { create(:retail_chain) }

  describe 'POST /v1/admin/retail_chains/:retail_chain_id/visitors' do
    context 'with an unauthorized user' do
      before do
        post(
          "/v1/admin/retail_chains/#{retail_chain.id}/visitors",
          params: visitor_params.to_json,
          headers: valid_headers
        )
      end

      it 'returns a 403 response' do
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  def visitor_params
    attributes_for(:visitor, retail_chain: retail_chain)
  end
end
