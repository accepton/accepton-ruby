require 'addressable/uri'
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

    def perform
      options_key = @request_method == :get ? :params : :form
      HTTP.with(@headers).public_send(@request_method, @uri.to_s, options_key => @options)
    end
  end
end
