RSpec.describe AcceptOn::Request do
  let(:client) { AcceptOn::Client.new(api_key: 'skey_123') }

  subject(:request) { AcceptOn::Request.new(client, :get, '/path') }

  describe '#perform' do
    subject { request.perform }

    before { stub_get('/path').to_return(body: '') }

    it 'sets the bearer authentication header from the client api key' do
      subject
      expect(a_get('/path').with do |request|
        request.headers['Authorization'] == "Bearer #{client.api_key}"
      end).to have_been_made
    end

    it 'sets the user agent from the client' do
      subject
      expect(a_get('/path').with do |request|
        request.headers['User-Agent'] == "accepton-ruby/#{AcceptOn::VERSION}"
      end).to have_been_made
    end
  end
end
