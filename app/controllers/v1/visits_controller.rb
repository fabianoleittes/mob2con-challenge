# frozen_string_literal: true

module V1
  class VisitsController < BaseController
    before_action :find_visitor

    def create
      @visit = @find_visitor.visits.new(visit_params)

      if @visit.save
        respond_with_json(@visit, :created)
      else
        respond_with_json(@visit.errors, :unprocessable_entity)
      end
    end

    def update
      find_visit do |visit|
        if visit.update(visit_params)
          respond_with_json(visit, :ok)
        else
          respond_with_json(visit.errors, :unprocessable_entity)
        end
      end
    end

    private

    def find_visit
      yield(Visit.find(params[:id]))
    end

    def find_visitor
      @find_visitor ||= Visitor.find(params[:visitor_id])
    end

    def visit_params
      params.require(:visit).permit(:entry_date, :exit_date)
    end
  end
end
