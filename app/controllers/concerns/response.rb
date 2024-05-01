# frozen_string_literal: true

module Response
  def respond_with_json(resource, status = :ok)
    render json: resource, status: status
  end

  def respond_with_errors(resource, status = :unprocessable_entity)
    errors = { errors: resource.errors.messages }

    render json: errors,
           status: status
  end

  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
