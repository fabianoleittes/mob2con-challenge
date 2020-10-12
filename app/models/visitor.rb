# frozen_string_literal: true

class Visitor < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  belongs_to :retail_chain
end
