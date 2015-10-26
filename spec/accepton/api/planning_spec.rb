RSpec.describe AcceptOn::API::Planning do
  subject(:client) { AcceptOn::Client.new(api_key: 'sky_123') }

  describe '#create_plan' do
    let(:creation_request) { stub_post('/v1/plans') }

    subject { client.create_plan(params) }

    context 'for a complete request' do
      let(:params) { {name: 'Test Plan', amount: 10_00, period_unit: 'month', currency: 'usd'} }

      before do
        creation_request
          .to_return(body: fixture('plan.json'), headers: {content_type: 'application/json'})
      end

      it 'requests the correct resource' do
        subject
        expect(creation_request).to have_been_made
      end

      it 'returns the created plan' do
        expect(subject.name).to eq('Test Plan')
        expect(subject.amount).to eq(10_00)
        expect(subject.currency).to eq('usd')
        expect(subject.period_unit).to eq('month')
      end
    end

    context 'for an incomplete request' do
      let(:params) { {} }

      before do
        creation_request
          .to_return(body: fixture('invalid_amount.json'), status: 400, headers: {content_type: 'application/json'})
      end

      it 'raises an error' do
        expect { subject }.to raise_error(AcceptOn::Error::BadRequest)
      end
    end
  end
end