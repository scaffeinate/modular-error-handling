class ErrorsController < ApplicationController
  def not_found
    respond_to do |format|
      format.json { render json: { status: 404, error: :not_found, message: 'Not Found' }, status: 404 }
      format.html
    end
  end

  def internal_server_error
    respond_to do |format|
      format.json { render json: { status: 500, error: :internal_server_error, message: 'Internal Server Error' }, status: 500 }
      format.html
    end
  end
end
