require 'addressable/uri'
require 'hashie/mash'
require 'http'
require 'accepton/headers'

module AcceptOn
  class Request
    URLS = {
      development: 'http://checkout.accepton.dev',
      production: 'https://checkout.accepton.com'
    }.freeze

    attr_accessor :client, :headers, :options, :path

    # @param client [AcceptOn::Client]
    # @param request_method [String, Symbol]
    # @param path [String]
    # @param options [Hash]
    # @return [Accepton::Request]
    def initialize(client, request_method, path, options = {})
      options = default_options.merge(options)
      url = URLS[options.delete(:environment).to_sym]
      @client = client
      @request_method = request_method
      @uri = Addressable::URI.parse(path.start_with?('http') ? path : url + path)
      @options = options
      @path = @uri.path
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

    # @return [Hash]
    def default_options
      {environment: :production}
    end
  end
end
