RSpec.describe AcceptOn::API::Promotion do
  subject(:client) { AcceptOn::Client.new(api_key: 'sky_123') }

  describe '#create_promo_code' do
    let(:creation_request) { stub_post('/v1/promo_codes') }

    subject { client.create_promo_code(params) }

    context 'for a complete request' do
      let(:params) { {name: '20OFF', promo_type: 'amount', value: 20_00} }

      before do
        creation_request
          .to_return(body: fixture('promo_code.json'), headers: {content_type: 'application/json'})
      end

      it 'requests the correct resource' do
        subject
        expect(creation_request).to have_been_made
      end

      it 'returns the created promo code' do
        expect(subject.name).to eq('20OFF')
        expect(subject.promo_type).to eq('amount')
        expect(subject.value).to eq(20_00)
      end
    end

    context 'for an incomplete request' do
      let(:params) { {} }

      before do
        creation_request
          .to_return(body: fixture('invalid_name.json'), status: 400, headers: {content_type: 'application/json'})
      end

      it 'raises an error' do
        expect { subject }.to raise_error(AcceptOn::Error::BadRequest)
      end
    end
  end

  describe '#delete_promo_code' do
    let(:promo_code) { AcceptOn::PromoCode.new(name: '20OFF', promo_type: 'amount', value: 20_00) }
    let(:delete_request) { stub_delete('/v1/promo_codes/20OFF') }

    subject { client.delete_promo_code(promo_code) }

    context 'for a complete request' do
      before do
        delete_request
          .to_return(body: fixture('promo_code.json'), headers: {content_type: 'application/json'})
      end

      it 'requests the correct resource' do
        subject
        expect(delete_request).to have_been_made
      end

      it 'returns the deleted promo code' do
        expect(subject.name).to eq('20OFF')
        expect(subject.promo_type).to eq('amount')
        expect(subject.value).to eq(20_00)
      end
    end
  end

  describe '#promo_code' do
    let(:retrieval_request) { stub_get('/v1/promo_codes/20OFF') }

    subject { client.promo_code('20OFF') }

    context 'for a complete request' do
      before do
        retrieval_request
          .to_return(body: fixture('promo_code.json'), headers: {content_type: 'application/json'})
      end

      it 'requests the correct resource' do
        subject
        expect(retrieval_request).to have_been_made
      end

      it 'returns the promo code' do
        expect(subject.name).to eq('20OFF')
        expect(subject.promo_type).to eq('amount')
        expect(subject.value).to eq(20_00)
      end
    end
  end

  describe '#update_promo_code' do
    let(:promo_code) { AcceptOn::PromoCode.new(name: '10OFF', promo_type: 'amount', value: 10_00) }
    let(:update_request) { stub_put('/v1/promo_codes/10OFF') }

    before do
      promo_code.name = '20OFF'
      promo_code.value = 20_00
    end

    subject { client.update_promo_code(promo_code) }

    context 'for a complete request' do
      before do
        update_request
          .to_return(body: fixture('promo_code.json'), headers: {content_type: 'application/json'})
      end

      it 'requests the correct resource' do
        subject
        expect(update_request).to have_been_made
      end

      it 'returns the updated promo code' do
        expect(subject.name).to eq('20OFF')
        expect(subject.promo_type).to eq('amount')
        expect(subject.value).to eq(20_00)
      end
    end

    context 'when a AcceptOn fails to update the resource' do
      before do
        update_request
          .to_return(body: fixture('invalid_name.json'), status: 400, headers: {content_type: 'application/json'})
      end

      it 'raises an error' do
        expect { subject }.to raise_error(AcceptOn::Error::BadRequest)
      end
    end
  end
end
