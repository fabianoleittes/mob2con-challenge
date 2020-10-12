# frozen_string_literal: true

module V1
  class VisitsController < BaseController
    before_action :find_visitor

    def create
      @visit = @find_visitor.visits.new(visit_params)

      if @visit.save
        json_response(@visit, :created)
      else
        json_response(@visit.errors, :unprocessable_entity)
      end
    end

    def update
      find_visit do |visit|
        if visit.update(visit_params)
          json_response(visit, :ok)
        else
          json_response(visit.errors, :unprocessable_entity)
        end
      end
    end

    private

    def find_visit
      visit = Visit.find(params[:id])
      yield(visit)
    end

    def find_visitor
      @find_visitor ||= Visitor.find(params[:visitor_id])
    end

    def visit_params
      params.require(:visit).permit(:entry_date, :exit_date)
    end
  end
end
