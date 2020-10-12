require 'rails_helper'

RSpec.describe Visitor, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
    it { is_expected.to belong_to :retail_chain }
  end
end
