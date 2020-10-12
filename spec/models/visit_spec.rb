# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Visit, type: :model do
  it { is_expected.to validate_presence_of :entry_date }
  it { is_expected.to belong_to :visitor }
end
