# frozen_string_literal: true

module V1
  class RetailChainsSummariesController < BaseController
    def index
      json_response(RetailChainSummary.process)
    end
  end
end
