class ErrorsController < ApplicationController
  def not_found
    respond_to do |format|
      format.json do
        render json: {
          status: 404,
          error: :not_found,
          message: 'Where did the 403 errors go'
        }, status: 404
      end
      format.html
    end
  end

  def internal_server_error
    respond_to do |format|
      format.json do
        render json: {
          status: 500,
          error: :internal_server_error,
          message: 'Houston we have a problem'
        }, status: 500
      end
      format.html
    end
  end
end
