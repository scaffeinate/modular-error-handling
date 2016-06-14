module Error
  module ErrorHandler
    def self.included(clazz)
      clazz.class_eval do
        rescue_from StandardError, with: :handle_error
        rescue_from CustomError, with: :custom_error
        rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
      end
    end

    private

    def record_not_found(_e)
      json = Helpers::Render.json(404, :record_not_found, _e.to_s)
      render json: json, status: 404
    end

    def custom_error(_e)
      json = _e.fetch_json
      render json: json, status: _e.status
    end

    def handle_error(_e)
      json = Helpers::Render.json(500, :internal_server_error, _e.to_s)
      render json: json, status: 500
    end
  end
end
