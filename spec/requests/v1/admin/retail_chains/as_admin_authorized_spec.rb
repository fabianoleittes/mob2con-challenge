# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'RetailChain API', type: :request do
  let!(:user) { create(:user, :admin) }

  describe 'POST /v1/admin/retail_chains' do
    context 'when the request is valid' do
      it 'create a retail_chain' do
        expect do
          make_request_for_retail_chain(valid_attributes)
        end.to change(RetailChain, :count).by(1)
      end

      it 'returns http status code created' do
        make_request_for_retail_chain(valid_attributes)
        expect(response).to have_http_status(:created)
      end

      it 'returns correct JSON payload' do
        make_request_for_retail_chain(valid_attributes)
        attr = json_response['retail_chain'].keys
        expect(attr).to contain_exactly(*retail_chain_fields)
      end

    end

    context 'when the request is invalid' do
      it 'returns http status code unprocessable_entity' do
        make_request_for_retail_chain(invalid_attributes)
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'does not create a retail_chain' do
        expect do
          make_request_for_retail_chain(invalid_attributes)
        end.not_to change(RetailChain, :count)
      end

      it 'returns errors on JSON payload' do
        make_request_for_retail_chain(invalid_attributes)
        expect(json_response['errors']).not_to be_empty
      end
    end
  end

  describe 'GET /v1/admin/retail_chains' do
    context 'when there is a list of retail_chains' do
      it 'returns http status code ok' do
        make_get_request_for_retail
        expect(response).to have_http_status(:ok)
      end

      it 'returns a list of retail_chains' do
        create_list_retail_chains
        make_get_request_for_retail
        expect(json_response['data'].size).to eq(5)
      end
    end

    context 'when there is no list of retail_chains' do
      it 'returns http status ok' do
        make_get_request_for_retail
        expect(response).to have_http_status(:ok)
      end 

      it 'returns an empty list' do
        make_get_request_for_retail
        expect(json_response['data'].size).to eq(0)
      end
    end
  end

  describe 'GET /v1/admin/retail_chains/:id' do
    context 'when the record exists' do
      it 'returns the retail_chain' do
        retailer = create_list_retail_chains
        retailer_id = retailer.first.id

        retailer_id = make_request_for_retail_chain_by_id(retailer_id)
        expect(json_response).not_to be_empty
      end

      it 'returns http status code ok' do
        retailer = create_list_retail_chains
        retailer_id = retailer.first.id

        make_request_for_retail_chain_by_id(retailer_id)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the record does not exist' do
      it 'returns http status code not_found' do
        make_request_for_retail_chain_by_id(42)
        expect(response).to have_http_status(:not_found)
      end

      it 'returns a not found message' do
        make_request_for_retail_chain_by_id(42)
        expect(response.body).to match(/Couldn't find RetailChain/)
      end
    end
  end

  describe 'PATCH /v1/admin/retail_chains/:id' do
    context 'when the request is valid' do
      it 'updates the specified retail_chain' do
        retailer = create_retailer

        make_update_request_for_retail_chain(retailer.id)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the request is invalid' do
      it 'returns https status code unprocessable_entity' do
        retailer = create_retailer

        make_update_request_for_retail_chain_with_invalid_attributes(retailer.id)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /v1/admin/retail_chains/:id' do
    context 'when the record not exists' do
      it 'returns a http status code not_found' do
        make_delete_request_for_retail_chain(42)
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when the record exists' do
      it 'returns a http status code no_content' do
        retailer = create_retailer

        make_delete_request_for_retail_chain(retailer.id)
        expect(response).to have_http_status(:no_content)
      end
    end
  end

  def valid_attributes
    { retail_chain: attributes_for(:retail_chain) }
  end

  def make_get_request_for_retail
    get(
      '/v1/admin/retail_chains',
      params: {},
      headers: valid_headers
    )
  end

  def make_request_for_retail_chain_by_id(id)
    get(
      "/v1/admin/retail_chains/#{id}",
      params: {},
      headers: valid_headers
    )
  end

  def make_request_for_retail_chain(attributes)
    post(
      '/v1/admin/retail_chains',
      params: attributes.to_json,
      headers: valid_headers
    )
  end

  def make_delete_request_for_retail_chain(id)
    delete(
      "/v1/admin/retail_chains/#{id}",
      params: {},
      headers: valid_headers
    )
  end

  def make_update_request_for_retail_chain_with_invalid_attributes(id)
    patch(
      "/v1/admin/retail_chains/#{id}",
      params: update_attributes,
      headers: valid_headers
    )
  end

  def make_update_request_for_retail_chain(id)
    patch(
      "/v1/admin/retail_chains/#{id}",
      params: update_attributes(name: 'Mob2ConLabs'),
      headers: valid_headers
    )
  end

  def update_attributes(name: '')
    retail_chains_params = {
      retail_chain: {
        name: name
      }
    }.to_json
  end

  def invalid_attributes
    { retail_chain: attributes_for(:retail_chain, name: '') }
  end


  def create_retailer
    create(:retail_chain)
  end

  def create_list_retail_chains
    create_list(:retail_chain, 5)
  end

  def retail_chain_fields
    %w[
      id
      name
      cnpj
      created_at
      updated_at
    ]
  end

  def build_admin_user
    create(:user, :admin)
  end
end
