# frozen_string_literal: true

module V1
  module Admin
    class VisitorsController < AdminsController
      before_action :find_visitor, only: %i[show update destroy]

      def index
        @visitors = Visitor.all.search_by_name(params)
        json_response(@visitors)
      end

      def show
        json_response(@find_visitor)
      end

      def create
        @visitor = Visitor.new(visitor_params)

        if @visitor.save
          json_response(@visitor, :created)
        else
          json_response(@visitor.errors, :unprocessable_entity)
        end
      end

      def update
        if @find_visitor.update(visitor_params)
          json_response(@find_visitor, :ok)
        else
          json_response(@find_visitor.errors, :unprocessable_entity)
        end
      end

      def destroy
        if @find_visitor.destroy
          render nothing: true, status: :no_content
        else
          json_response(@find_visitor, :not_found)
        end
      end

      private

      def find_visitor
        @find_visitor ||= Visitor.find(params[:id])
      end

      def visitor_params
        params.permit(
          :name,
          :retail_chain_id,
          :avatar
        )
      end
    end
  end
end
