require 'accepton/api/tokenization'

module AcceptOn
  class Client
    include AcceptOn::API::Tokenization

    attr_accessor :api_key
    attr_writer :user_agent

    # Initializes a new Client object
    #
    # @param options [Hash]
    # @return [AcceptOn::Client]
    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
      yield(self) if block_given?
    end

    # @return [Boolean]
    def api_key?
      !!api_key
    end

    # @return [String]
    def user_agent
      @user_agent ||= "accepton-ruby/#{AcceptOn::VERSION}"
    end
  end
end
