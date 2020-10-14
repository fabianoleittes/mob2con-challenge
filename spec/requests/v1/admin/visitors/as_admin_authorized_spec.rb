# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Visitors API', type: :request do
  let!(:user) { create(:user, :be_admin) }
  let(:retail_chain) { create(:retail_chain) }
  let(:visitor) { create(:visitor) }

  describe 'POST /v1/admin/retail_chains/:retail_chain_id/visitors' do
    context 'with valid data' do
      before do
        post(
          "/v1/admin/retail_chains/#{retail_chain.id}/visitors",
          params: visitor_params.to_json,
          headers: valid_headers
        )
      end

      it 'returns a 201 response' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid data' do
      before do
        post(
          "/v1/admin/retail_chains/#{retail_chain.id}/visitors",
          params: {},
          headers: valid_headers
        )
      end

      it 'returns a 422 response' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /v1/admin/retail_chains/:retail_chain_id/visitors' do
    let!(:visitors) { create_list(:visitor, 5) }

    before do
      get(
        "/v1/admin/retail_chains/#{retail_chain.id}/visitors",
        params: {},
        headers: valid_headers
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

  describe 'GET /v1/admin/retail_chains/:retail_chain_id/visitors/:id' do
    before do
      get(
        "/v1/admin/retail_chains/#{retail_chain.id}/visitors/#{visitor.id}",
        params: {},
        headers: valid_headers
      )
    end

    context 'when the record exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the record does not exist' do
      before do
        get(
          "/v1/admin/retail_chains/#{retail_chain.id}/visitors/42",
          params: {},
          headers: valid_headers
        )
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Visitor/)
      end
    end
  end

  describe 'PATCH /v1/admin/retail_chains/:retail_chain_id/visitors/:id' do
    context 'with valid data' do
      it 'updates the specified visitor' do
        visitor_params = {
          visitor: {
            name: 'Makro'
          }
        }.to_json

        patch(
          "/v1/admin/retail_chains/#{retail_chain.id}/visitors/#{visitor.id}",
          params: visitor_params,
          headers: valid_headers
        )

        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid data' do
      let!(:invalid_params) { build(:visitor, name: '') }

      it 'returns error code' do
        patch(
          "/v1/admin/retail_chains/#{retail_chain.id}/visitors/#{visitor.id}",
          params: invalid_params.to_json,
          headers: valid_headers
        )
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /v1/admin/retail_chains/:retail_chain_id/visitors/:id' do
    context 'when record not exists' do
      it 'returns a response 404' do
        delete(
          "/v1/admin/retail_chains/#{retail_chain.id}/visitors/42",
          params: {},
          headers: valid_headers
        )
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when record exists' do
      it 'returns a response 204' do
        delete(
          "/v1/admin/retail_chains/#{retail_chain.id}/visitors/#{visitor.id}",
          params: {},
          headers: valid_headers
        )
        expect(response).to have_http_status(:no_content)
      end
    end
  end

  def visitor_params
    attributes_for(:visitor, retail_chain_id: retail_chain.id)
  end
end
