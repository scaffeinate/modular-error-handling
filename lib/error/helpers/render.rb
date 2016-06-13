module Error::Helpers
  class Render
    def self.json(_status, _error, _message)
      {
        status: _status,
        error: _error,
        message: _message
      }.as_json
    end
  end
end
