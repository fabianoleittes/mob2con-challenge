# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RetailChain, type: :model do
  context 'when validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:cnpj) }
    it { is_expected.to validate_uniqueness_of(:cnpj).case_insensitive }
  end
end
