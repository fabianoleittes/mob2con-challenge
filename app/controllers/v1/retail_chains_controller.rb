module V1
  class RetailChainsController < BaseController
    before_action :authorize_request, :require_be_admin

    def index
      json_response(RetailChain.all)
    end

    def create
      @retail_chain = RetailChain.new(retail_chains_params)

      if @retail_chain.save
        json_response(@retail_chain, :created)
      else
        json_response(@retail_chain.errors, :unprocessable_entity)
      end
    end

    private

    def retail_chains_params
      params.permit(
        :name,
        :cnpj
      )
    end
  end
end
