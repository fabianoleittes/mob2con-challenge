# frozen_string_literal: true

class Visitor < ApplicationRecord
  include Filterable

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  belongs_to :retail_chain
  has_many :visits, dependent: :destroy

  has_one_attached :avatar
end
