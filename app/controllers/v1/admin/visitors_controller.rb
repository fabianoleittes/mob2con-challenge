# frozen_string_literal: true

module V1
  module Admin
    class VisitorsController < AdminsController
      before_action :find_retail_chain

      def index
        @visitors = Visitor.all.search_by_name(params)
        respond_with_json(
          VisitorBlueprint.render(
            @visitors,
            root: :data
          )
        )
      end

      def show
        find_visitor do |visitor|
          respond_with_json(
            VisitorBlueprint.render(
              visitor,
              root: :visitor
            )
          )
        end
      end

      def create
        save_visitor
      end

      def update
        update_visitor
      end

      def destroy
        destroy_visitor
      end

      private

      def build_visitor
        yield(Visitor.new(visitor_params))
      end

      def save_visitor
        build_visitor do |visitor|
          if visitor.save
            respond_with_json(
              VisitorBlueprint.render(
                visitor,
                root: :visitor
              ), :created
            )
          else
            respond_with_errors(visitor)
          end
        end
      end

      def update_visitor
        find_visitor do |visitor|
          if visitor.update(visitor_params)
            respond_with_json(
              VisitorBlueprint.render(
                visitor,
                root: :visitor
              )
            )
          else
            respond_with_errors(visitor)
          end
        end
      end

      def destroy_visitor
        find_visitor do |visitor|
          if visitor.destroy
            render nothing: true, status: :no_content
          else
            respond_with_errors(visitor, :not_found)
          end
        end
      end

      def find_visitor
        yield(Visitor.find(params[:id]))
      end

      def find_retail_chain
        @find_retail_chain ||= RetailChain.find(params[:retail_chain_id])
      end

      def visitor_params
        params
          .require(:visitor)
          .permit(
            :name,
            :retail_chain_id,
            :avatar
          )
      end
    end
  end
end
