module Error
  class CustomError < StandardError
    attr_reader :status, :error, :message, :where_to_redirect

    def initialize(_error = nil, _status = nil, _message = nil, _where_to_redirect = nil)
      @error = _error || 422
      @status = _status || :unprocessable_entity
      @message = _message || 'Something went wrong'
      @where_to_redirect = _where_to_redirect || :root
    end

    def fetch_json
      Helpers::Render.json(error, message, status)
    end
  end
end
