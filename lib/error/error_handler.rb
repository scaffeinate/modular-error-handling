module Error
  module ErrorHandler
    def self.included(clazz)
      clazz.class_eval do
        rescue_from StandardError, with: :standard_error
        rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
      end
    end

    private

    def standard_error(_e)
      json = Helpers::Render.json(422, :unprocessable_entity, _e.to_s)
      respond_to do |_format|
        render json: json, status: 422
        format.html { redirect_to root_path, flash: { error: _e.to_s } }
      end
    end

    def record_not_found(_e)
      json = Helpers::Render.json(404, :not_found, _e.to_s)
      respond_to do |format|
        format.json { render json: json, status: 404 }
        format.html { redirect_to root_path, flash: { error: _e.to_s } }
      end
    end
  end
end
