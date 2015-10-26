RSpec.describe AcceptOn::API::Subscribing do
  subject(:client) { AcceptOn::Client.new(api_key: 'sky_123') }

  describe '#cancel_subscription' do
    let(:cancel_request) { stub_post("/v1/subscriptions/sub_123/cancel") }

    subject { client.cancel_subscription('sub_123') }

    context 'for a complete request' do
      before do
        cancel_request
          .to_return(body: fixture('subscription.json'), headers: {content_type: 'application/json'})
      end

      it 'requests the correct resource' do
        subject
        expect(cancel_request).to have_been_made
      end

      it 'returns the cancelled subscription' do
        expect(subject.email).to eq('test1@email.com')
      end
    end

    context 'for an incomplete request' do
      before do
        cancel_request
          .to_return(body: fixture('unable_to_cancel_subscription.json'), status: 400, headers: {content_type: 'application/json'})
      end

      it 'raises an error' do
        expect { subject }.to raise_error(AcceptOn::Error::BadRequest)
      end
    end
  end
end