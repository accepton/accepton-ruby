module AcceptOn
  class Headers
    # @param client [AcceptOn::Client]
    # @return [AcceptOn::Headers]
    def initialize(client)
      @client = client
    end

    # @return [Hash]
    def request_headers
      headers = {}
      headers[:accept] = 'application/json'
      headers[:authorization] = bearer_auth_header
      headers[:user_agent] = @client.user_agent
      headers
    end

    private

    def bearer_auth_header
      "Bearer #{@client.api_key}"
    end
  end
end
