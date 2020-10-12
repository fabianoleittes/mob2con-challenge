# frozen_string_literal: true

module Filterable
  extend ActiveSupport::Concern

  included do
    scope :search_by_name, lambda { |params|
      return unless params.key?(:name)

      where('name LIKE ?', params[:name])
    }
  end
end
