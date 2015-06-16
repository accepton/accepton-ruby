RSpec.describe AcceptOn::API::Refunding do
  subject(:client) { AcceptOn::Client.new(api_key: 'skey_123') }

  describe '#refund' do
    let(:refund_request) { stub_post('/v1/refunds') }

    subject { client.refund(params) }

    context 'for a complete request' do
      let(:params) { {amount: 1_00, authorization_id: 'chg_123'} }

      before do
        refund_request.to_return(body: fixture('refund.json'), headers: {content_type: 'application/json'})
      end

      it 'requests the correct resource' do
        subject
        expect(refund_request).to have_been_made
      end

      it 'returns the created refund' do
        expect(subject.id).to eq('ref_123')
        expect(subject.amount).to eq(1_00)
      end
    end

    context 'for an incomplete request' do
      let(:params) { {} }

      before do
        refund_request.to_return(body: fixture('invalid_amount.json'), status: 400, headers: {content_type: 'application/json'})
      end

      it 'raises an error' do
        expect { subject }.to raise_error(AcceptOn::Error::BadRequest)
      end
    end
  end
end
