module AcceptOn
  class Error < StandardError
    attr_reader :status_code

    # Raised when AcceptOn returns a 4xx HTTP status code
    ClientError = Class.new(self)

    # Raised when AcceptOn returns a 400 HTTP status code
    BadRequest = Class.new(ClientError)

    # Raised when AcceptOn returns a 401 HTTP status code
    Unauthorized = Class.new(ClientError)

    # Raised when AcceptOn returns a 5xx HTTP status code
    ServerError = Class.new(self)

    # Raised when AcceptOn returns a 500 HTTP status code
    InternalServerError = Class.new(ServerError)

    # Raised when AcceptOn returns a 502 HTTP status code
    BadGateway = Class.new(ServerError)

    # Raised when AcceptOn returns a 503 HTTP status code
    ServiceUnavailable = Class.new(ServerError)

    # Raised when AcceptOn returns a 504 HTTP status code
    GatewayTimeout = Class.new(ServerError)

    ERRORS = {
      400 => AcceptOn::Error::BadRequest,
      401 => AcceptOn::Error::Unauthorized,
      500 => AcceptOn::Error::InternalServerError,
      502 => AcceptOn::Error::BadGateway,
      503 => AcceptOn::Error::ServiceUnavailable,
      504 => AcceptOn::Error::GatewayTimeout
    }

    class << self
      # @param response_body [Hashie::Mash]
      # @param status_code [Integer]
      # @return [AcceptOn::Error]
      def from_response(response_body, status_code)
        return unless ERRORS.key?(status_code)
        error_class = ERRORS[status_code]
        message = parse_error(response_body)
        error_class.new(message, status_code)
      end

      private

      def parse_error(body)
        return '' if body.nil? || body.empty?

        body.error.message
      end
    end

    # @param message [String]
    # @param code [Integer]
    # @return [AcceptOn::Error]
    def initialize(message = '', code = nil)
      super(message)
      @status_code = code
    end
  end
end
