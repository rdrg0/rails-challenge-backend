# frozen_string_literal: true

module Response
  # Renders the object passed with a status or :ok
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
