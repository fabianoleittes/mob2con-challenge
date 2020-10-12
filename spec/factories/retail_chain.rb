FactoryBot.define do
  factory :retail_chain do
    name { FFaker::Company.name }
    cnpj { CNPJ.generate }
  end
end
