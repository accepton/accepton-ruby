RSpec.describe AcceptOn::PromoCode do
  subject(:promo_code) { AcceptOn::PromoCode.new(name: 'FUN', promo_type: 'amount', value: 5_00) }

  describe '#as_params' do
    subject { promo_code.as_params }

    it { is_expected.to eq(name: 'FUN', promo_type: 'amount', value: 5_00) }
  end

  describe '#name=' do
    subject { promo_code.name = 'NOTFUN' }

    it 'sets the name of the promo code' do
      subject
      expect(promo_code.name).to eq('NOTFUN')
    end

    it 'memorizes the old name of the promo code' do
      subject
      expect(promo_code.original_name).to eq('FUN')
    end

    it 'only memorizes the original name once' do
      subject
      subject
      expect(promo_code.original_name).to eq('FUN')
    end
  end
end
