module Error
  module ErrorHandler
    def self.included(clazz)
      clazz.class_eval do
        rescue_from StandardError do |e|
          respond(:unprocessable_entity, 422, e.to_s)
        end
        rescue_from ActiveRecord::RecordNotFound do |e|
          respond(:record_not_found, 404, e.to_s)
        end
        rescue_from NotVisibleError do |e|
          respond(e.error, e.status, e.message, not_visible_path)
        end
      end
    end

    private

    def respond(_error, _status, _message, where_to_redirect = root_path)
      json = Helpers::Render.json(_error, _status, _message)
      respond_to do |format|
        format.json { render json: json }
        format.html { redirect_to where_to_redirect, flash: { error: _message.to_s } }
      end
    end
  end
end
