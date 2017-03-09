module Response
  # json response with default status of ok
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
