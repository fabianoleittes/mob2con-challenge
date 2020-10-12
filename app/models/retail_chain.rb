# frozen_string_literal: true

class RetailChain < ApplicationRecord
  validates :name, presence: true
  validates :cnpj, presence: true, uniqueness: { case_sensitive: false }

  has_many :users, dependent: :nullify
  has_many :visitors, dependent: :destroy

  scope :search_by_name, lambda { |params|
    return unless params.key?(:name)

    where('name LIKE ?', params[:name])
  }
end
