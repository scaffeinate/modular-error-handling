module Error
  module ErrorHandler
    def self.included(clazz)
      clazz.class_eval do
        rescue_from StandardError do |e|
          respond(:internal_server_error, 500, e.to_s)
        end
        rescue_from CustomError do |e|
          respond(e.error, e.status, e.message)
        end
        rescue_from ActiveRecord::RecordNotFound do |e|
          respond(:record_not_found, 404, e.to_s)
        end
      end
    end

    private

    def respond(_error, _status, _message)
      json = Helpers::Render.json(_error, _status, _message)
      respond_to do |format|
        format.json { render json: json }
        format.html { redirect_to root_path, flash: { error: _message.to_s } }
      end
    end
  end
end
