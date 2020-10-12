# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Visits API', type: :request do
  let!(:visitor) { create(:visitor) }

  describe 'POST /v1/visitors/:visitor_id/visits' do
    context 'with valid data' do
      let(:visit_params) { attributes_for(:visit) }

      before do
        post(
          "/v1/visitors/#{visitor.id}/visits",
          params: visit_params.to_json,
          headers: headers
        )
      end

      it 'returns a 201 response' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid data' do
      let(:visit_invalid_params) { attributes_for(:visit, entry_date: nil) }

      before do
        post(
          "/v1/visitors/#{visitor.id}/visits",
          params: visit_invalid_params.to_json,
          headers: headers
        )
      end
      it 'returns a 422 response' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /v1/visitors/:visitor_id/visits/:id' do
    let!(:visit) { create(:visit, visitor: visitor) }

    context 'with valid data' do
      let(:new_entry_date) { Time.zone.now.strftime('%Y-%m-%d %H:%M:%S') }
      let(:visit_params) { { visit: { entry_date: new_entry_date } } }

      before do
        patch(
          "/v1/visitors/#{visitor.id}/visits/#{visit.id}",
          params: visit_params.to_json,
          headers: headers
        )
      end

      it 'returns a 201 response' do
        expect(response).to have_http_status(:ok)
      end
    end
    context 'with invalid data' do
      let(:visit_invalid_params) { attributes_for(:visit, entry_date: nil) }

      before do
        patch(
          "/v1/visitors/#{visitor.id}/visits/#{visit.id}",
          params: visit_invalid_params.to_json,
          headers: headers
        )
      end
      it 'returns a 422 response' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end

