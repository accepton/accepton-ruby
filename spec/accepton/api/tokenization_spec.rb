RSpec.describe AcceptOn::API::Tokenization do
  subject(:client) { AcceptOn::Client.new(api_key: 'skey_123') }

  describe '#create_token' do
    let(:token_request) do
      stub_post('/tokens')
    end

    subject { client.create_token(params) }

    context 'for a complete request' do
      let(:params) { {amount: 1_00, description: 'Test Description'} }

      before do
        token_request.to_return(body: fixture('token.json'), headers: {content_type: 'application/json'})
      end

      it 'requests the correct resource' do
        subject
        expect(token_request).to have_been_made
      end

      it 'returns the created token' do
        expect(subject.id).to eq('txn_b43a7e1e51410639979ab2047c156caa')
        expect(subject.amount).to eq(1_00)
        expect(subject.description).to eq('Test Description')
      end
    end

    context 'for an incomplete request' do
      let(:params) { {} }

      before do
        token_request.to_return(body: fixture('invalid_amount.json'), status: 400, headers: {content_type: 'application/json'})
      end

      it 'raises an error' do
        expect { subject }.to raise_error(AcceptOn::Error::BadRequest)
      end
    end
  end
end
