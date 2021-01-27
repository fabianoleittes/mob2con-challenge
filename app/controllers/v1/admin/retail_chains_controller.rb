# frozen_string_literal: true

module V1
  module Admin
    class RetailChainsController < AdminsController
      def index
        @retail_chains = RetailChain.all.search_by_name(params)
        respond_with_json(
          RetailChainBlueprint.render(
            @retail_chains,
            root: :data
          )
        )
      end

      def show
        find_retail_chain do |retailer|
          respond_with_json(
            RetailChainBlueprint.render(
              retailer, root: :retail_chain
            )
          )
        end
      end

      def create
        save_retailer
      end

      def update
        update_retailer
      end

      def destroy
        destroy_retailer
      end

      private

      def save_retailer
        build_retailer do |retailer|
          if retailer.save
            respond_with_json(
              RetailChainBlueprint.render(
                retailer, root: :retail_chain
              ), :created
            ) 
          else
            respond_with_errors(retailer)
          end
        end
      end

      def build_retailer
        yield(RetailChain.new(retail_chains_params))
      end

      def update_retailer
        find_retail_chain do |retailer|
          if retailer.update(retail_chains_params)
            respond_with_json(
              RetailChainBlueprint.render(
                retailer, root: :retail_chain
              )
            )
          else
            respond_with_errors(retailer)
          end
        end
      end

      def destroy_retailer
        find_retail_chain do |retailer|
          if retailer.destroy
            render nothing: true, status: :no_content
          else
            respond_with_errors(retailer, :not_found)
          end
        end
      end

      def find_retail_chain
        yield(RetailChain.find(params[:id]))
      end

      def retail_chains_params
        params
          .require(:retail_chain)
          .permit(
            :name,
            :cnpj
          )
      end
    end
  end
end
