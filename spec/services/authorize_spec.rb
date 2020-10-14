# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Authorize do
  subject(:request_obj) { described_class.new(valid_headers) }

  let(:user) { create(:user) }

  let(:invalid_request_obj) { described_class.new(invalid_headers) }

  describe '#call' do
    context 'when valid request' do
      it 'returns user object' do
        result = request_obj.call
        expect(result[:user]).to eq(user)
      end
    end

    context 'when missing token' do
      it 'raises a MissingToken error' do
        expect { invalid_request_obj.call }
          .to raise_error(ExceptionHandler::MissingToken, 'Missing token')
      end
    end

    context 'when invalid token' do
      subject(:invalid_request_obj) do
        described_class.new('Authorization' => token_generator(42))
      end

      it 'raises an InvalidToken error' do
        expect { invalid_request_obj.call }
          .to raise_error(ExceptionHandler::InvalidToken, /Invalid token/)
      end
    end

    context 'when token is expired' do
      subject(:request_obj) { described_class.new(header) }

      let(:header) { { 'Authorization' => expired_token_generator(user.id) } }

      it 'raises ExceptionHandler::ExpiredSignature error' do
        expect { request_obj.call }
          .to raise_error(
            ExceptionHandler::InvalidToken,
            /Signature has expired/
          )
      end

      context 'when fake token' do
        subject(:invalid_request_obj) { described_class.new(header) }

        let(:header) { { 'Authorization' => 'mob2con' } }

        it 'handles JWT::DecodeError' do
          expect { invalid_request_obj.call }
            .to raise_error(
              ExceptionHandler::InvalidToken,
              /Not enough or too many segments/
            )
        end
      end
    end
  end
end
