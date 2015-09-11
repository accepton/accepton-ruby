RSpec.describe AcceptOn::API::Querying do
  subject(:client) { AcceptOn::Client.new(api_key: 'skey_123') }

  describe '#charge' do
    let(:charge_request) { stub_get('/v1/charges/chg_ff6024ab78980de7') }

    subject { client.charge('chg_ff6024ab78980de7') }

    context 'for an existing charge' do
      before do
        charge_request
          .to_return(body: fixture('charge.json'), headers: {content_type: 'application/json'})
      end

      it 'requests the correct resource' do
        subject
        expect(charge_request).to have_been_made
      end

      it 'returns the existing charge' do
        expect(subject.id).to eq('chg_ff6024ab78980de7')
        expect(subject.amount).to eq(10_00)
        expect(subject.application_fee).to be_nil
        expect(subject.created_at).to eq(Time.utc(2015, 6, 26, 22, 13, 29))
        expect(subject.currency).to eq('usd')
        expect(subject.description).to eq('Test Transaction')
        expect(subject.metadata).to eq({})
        expect(subject.refunded).to eq(false)
        expect(subject.remote_id).to eq('ch_16I54f2EZMTOjTLjGB8nd84P')
        expect(subject.status).to eq('paid')
      end
    end

    context 'for a non-existent charge' do
      before do
        charge_request
          .to_return(status: 400, body: fixture('invalid_charge_id.json'), headers: {content_type: 'application/json'})
      end

      it 'raises an error' do
        expect { subject }.to raise_error(AcceptOn::Error::BadRequest)
      end
    end
  end

  describe '#charges' do
    let(:charges_request) { stub_get('/v1/charges') }
    let(:params) { {} }

    subject { client.charges(params) }

    context 'when there are no charges on the account' do
      before do
        charges_request
          .to_return(body: fixture('empty_list.json'), headers: {content_type: 'application/json'})
      end

      it { is_expected.to be_empty }
    end

    context 'when there are charges on the account' do
      before do
        charges_request
          .to_return(body: fixture('charges_list.json'), headers: {content_type: 'application/json'})
      end

      it 'returns the list of charges' do
        expect(subject.length).to eq(3)
        subject.each { |charge| expect(charge).to be_an(AcceptOn::Charge) }
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

  describe '#promo_codes' do
    let(:retrieval_request) { stub_get('/v1/promo_codes') }

    subject { client.promo_codes(args) }

    context 'for a complete request' do
      context 'without any args' do
        let(:args) { {} }

        before do
          retrieval_request
            .with(query: {})
            .to_return(body: fixture('promo_codes.json'), headers: {content_type: 'application/json'})
        end

        it 'requests the correct resource' do
          subject
          expect(retrieval_request).to have_been_made
        end

        it 'returns the promo codes' do
          expect(subject.length).to eq(2)
          subject.each do |promo_code|
            expect(promo_code).to be_an AcceptOn::PromoCode
          end
        end
      end

      context 'filtering by promo type' do
        let(:args) { {promo_type: 'percentage'} }

        before do
          retrieval_request
            .with(query: {promo_type: 'percentage'})
            .to_return(body: fixture('promo_codes.json'), headers: {content_type: 'application/json'})
        end

        it 'requests the correct resource' do
          subject
          expect(retrieval_request).to have_been_made
        end

        it 'returns the promo codes' do
          expect(subject.length).to eq(2)
          subject.each do |promo_code|
            expect(promo_code).to be_an AcceptOn::PromoCode
          end
        end
      end
    end
  end

  describe '#token' do
    let(:token_request) { stub_get('/v1/tokens/txn_b43a7e1e51410639979ab2047c156caa') }

    subject { client.token('txn_b43a7e1e51410639979ab2047c156caa') }

    context 'for an existing token' do
      before do
        token_request
          .to_return(body: fixture('token.json'), headers: {content_type: 'application/json'})
      end

      it 'requests the correct resource' do
        subject
        expect(token_request).to have_been_made
      end

      it 'returns the existing token' do
        expect(subject.id).to eq('txn_b43a7e1e51410639979ab2047c156caa')
        expect(subject.amount).to eq(1_00)
        expect(subject.description).to eq('Test Description')
      end
    end

    context 'for a non-existent token' do
      before do
        token_request
          .to_return(status: 404, body: fixture('invalid_token.json'), headers: {content_type: 'application/json'})
      end

      it 'raises an error' do
        expect { subject }.to raise_error(AcceptOn::Error::NotFound)
      end
    end
  end
end
