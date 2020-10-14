# frozen_string_literal: true

class RetailChain < ApplicationRecord
  include Filterable

  validates :name, presence: true
  validates :cnpj, presence: true, uniqueness: { case_sensitive: false }

  has_many :users, dependent: :nullify
  has_many :visitors, dependent: :destroy
end
