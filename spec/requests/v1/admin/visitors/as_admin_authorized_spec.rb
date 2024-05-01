# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Visitors API', type: :request do
  let!(:user) { create(:user, :admin) }

  describe 'POST /v1/admin/retail_chains/:retail_chain_id/visitors' do
    context 'when the request is valid' do
      it 'create a visitor' do
        expect do
          make_post_request_for_visitor(valid_attributes)
        end.to change(Visitor, :count).by(1)
      end

      it 'returns http status code created' do
        make_post_request_for_visitor(valid_attributes)

        expect(response).to have_http_status(:created)
      end

      it 'returns correct JSON payload' do
        make_post_request_for_visitor(valid_attributes)
        attr = json_response['visitor'].keys

        expect(attr).to contain_exactly(*visitor_fields)
      end
    end

    context 'when the request is invalid' do
      it 'returns http status code unprocessable_entity' do
        make_post_request_for_visitor(invalid_attributes)

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'does not create a visitor' do
        expect do
          make_post_request_for_visitor(invalid_attributes)
        end.not_to change(Visitor, :count)
      end

      it 'returns errors on JSON payload' do
        make_post_request_for_visitor(invalid_attributes)

        expect(json_response['errors']).not_to be_empty
      end
    end
  end

  describe 'GET /v1/admin/retail_chains/:retail_chain_id/visitors' do
    context 'when there is a list of visitors' do
      it 'returns http status code ok' do
        make_get_request_for_visitor

        expect(response).to have_http_status(:ok)
      end

      it 'returns a list of visitors' do
        create_list_for_visitors
        make_get_request_for_visitor

        expect(json_response['data'].size).to eq(5)
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

  def make_post_request_for_visitor(attributes)
    post(
      "/v1/admin/retail_chains/#{retail_chain.id}/visitors",
      params: attributes.to_json,
      headers: valid_headers
    )
  end

  def make_get_request_for_visitor
    get(
      "/v1/admin/retail_chains/#{retail_chain.id}/visitors",
      params: {},
      headers: valid_headers
    )
  end

  def make_request_for_visitor_by_id(id)
    get(
      "/v1/admin/retail_chains/#{retail_chain.id}/visitors/#{id}",
      params: {},
      headers: valid_headers
    )
  end

  def create_list_for_visitors
    create_list(:visitor, 5)
  end

  def retail_chain
    create(:retail_chain)
  end

  def visitor
    create(:visitor)
  end

  def valid_attributes
    { visitor: attributes_for(:visitor, retail_chain_id: retail_chain.id) }
  end

  def invalid_attributes
    { visitor: attributes_for(:visitor, retail_chain_id: nil) }
  end

  def visitor_fields
    %w[
      id
      name
      avatar
      created_at
      updated_at
      retail_chain
    ]
  end
end
