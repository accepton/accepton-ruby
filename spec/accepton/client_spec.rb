RSpec.describe AcceptOn::Client do
  describe '#api_key?' do
    it 'is true when the user api key is present' do
      client = AcceptOn::Client.new(api_key: 'skey_123')
      expect(client.api_key?).to be true
    end

    it 'is false when the user api key is missing' do
      expect(subject.api_key?).to be false
    end
  end

  describe '#user_agent' do
    it 'defaults to accepton-ruby/version' do
      expect(subject.user_agent).to eq "accepton-ruby/#{AcceptOn::VERSION}"
    end
  end

  describe '#user_agent=' do
    it 'overwrites the default User-Agent' do
      subject.user_agent = 'AcceptOnClient/1.0.0'
      expect(subject.user_agent).to eq 'AcceptOnClient/1.0.0'
    end
  end
end
