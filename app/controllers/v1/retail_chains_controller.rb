module V1
  class RetailChainsController < BaseController
    before_action :authorize_request, :require_be_admin
    before_action :find_retail_chain, only: %i[show update destroy]

    def index
      json_response(RetailChain.all)
    end

    def show
      json_response(@find_retail_chain)
    end

    def create
      @retail_chain = RetailChain.new(retail_chains_params)

      if @retail_chain.save
        json_response(@retail_chain, :created)
      else
        json_response(@retail_chain.errors, :unprocessable_entity)
      end
    end

    def update
      if @find_retail_chain.update(retail_chains_params)
        json_response(@find_retail_chain, :ok)
      else
        json_response(@find_retail_chain.errors, :unprocessable_entity)
      end
    end
    
    def destroy
      if @find_retail_chain.destroy
        render nothing: true, status: :no_content
      else
        json_response(@find_retail_chain, :not_found)
      end
    end

    private

    def find_retail_chain
      @find_retail_chain ||= RetailChain.find(params[:id])
    end

    def retail_chains_params
      params.permit(
        :name,
        :cnpj
      )
    end
  end
end
