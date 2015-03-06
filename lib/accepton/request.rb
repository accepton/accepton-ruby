require 'addressable/uri'
require 'hashie/mash'
require 'http'
require 'accepton/headers'

module AcceptOn
  class Request
    BASE_URL = 'http://checkout.accepton.dev'

    attr_accessor :client, :headers, :options, :path

    # @param client [AcceptOn::Client]
    # @param request_method [String, Symbol]
    # @param path [String]
    # @param options [Hash]
    # @return [Accepton::Request]
    def initialize(client, request_method, path, options = {})
      @client = client
      @request_method = request_method
      @uri = Addressable::URI.parse(path.start_with?('http') ? path : BASE_URL + path)
      @path = @uri.path
      @options = options
      @headers = AcceptOn::Headers.new(@client).request_headers
    end

    # @return [Hashie::Mash] if the request reutrns a success code
    # @raise [AcceptOn::Error] if the request returns a failure code
    def perform
      options_key = @request_method == :get ? :params : :form
      response = HTTP.with(@headers).public_send(@request_method, @uri.to_s, options_key => @options)
      response_body = Hashie::Mash.new(response.parse)
      fail_or_return_response_body(response_body, response.code)
    end

    private

    def fail_or_return_response_body(body, status_code)
      error = AcceptOn::Error.from_response(body, status_code)
      fail(error) if error
      body
    end
  end
end
