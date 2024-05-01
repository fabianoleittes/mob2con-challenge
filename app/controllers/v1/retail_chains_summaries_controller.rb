# frozen_string_literal: true

module V1
  class RetailChainsSummariesController < BaseController
    def index
      respond_with_json(RetailChainSummary.process)
    end
  end
end
