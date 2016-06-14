module Error
  class CustomError < StandardError
    attr_reader :status, :error, :message

    def initialize
      @error = 422
      @status = :unprocessable_entity
      @message = 'Something went wrong'
    end

    def fetch_json
      Helpers::Render.json(error, message, status)
    end
  end
end
