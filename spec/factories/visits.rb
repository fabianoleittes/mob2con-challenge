# frozen_string_literal: true

FactoryBot.define do
  factory :visit do
    entry_date { (0..3).to_a.sample.days.ago }
    exit_date { 5.days.from_now }
    association :visitor
  end
end
