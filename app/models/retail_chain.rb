class RetailChain < ApplicationRecord
  validates :name, presence: true
  validates :cnpj, presence: true, uniqueness: { case_sensitive: false }

  has_many :users, dependent: :nullify
end
