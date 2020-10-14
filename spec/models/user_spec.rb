# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password_digest) }
  end
end
