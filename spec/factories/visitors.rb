# frozen_string_literal: true

FactoryBot.define do
  factory :visitor do
    name { FFaker::Name.name }
    association :retail_chain
  end
end
