# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    password { '12345678' }
    password_confirmation { '12345678' }
    admin { false }
  end

  trait :invalid do
    email {}
    password {}
  end

  trait :admin do
    admin { true }
  end
end
