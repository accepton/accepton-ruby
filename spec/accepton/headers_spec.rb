RSpec.describe AcceptOn::Headers do
  let(:client) { AcceptOn::Client.new(api_key: 'skey_123') }

  subject(:headers) { AcceptOn::Headers.new(client) }

  describe '#request_headers' do
    subject { headers.request_headers }

    it 'sets the accept header to application/json' do
      expect(subject[:accept]).to eq 'application/json'
    end

    it 'sets the authorization bearer token to the client api key' do
      expect(subject[:authorization]).to eq "Bearer #{client.api_key}"
    end

    it 'sets the user agent from the client' do
      expect(subject[:user_agent]).to eq client.user_agent
    end
  end
end
