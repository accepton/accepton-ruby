require 'hashie/mash'

RSpec.describe AcceptOn::Error do
  let(:message) { '' }
  let(:status_code) { 400 }

  subject(:error) { AcceptOn::Error.new(message, status_code) }

  describe '.from_response' do
    AcceptOn::Error::ERRORS.each do |status, error|
      context "when the HTTP status is #{status}" do
        it "returns an #{error}" do
          response = Hashie::Mash.new(error: {message: 'error message'})
          expect(AcceptOn::Error.from_response(response, status)).to be_an error
        end
      end
    end
  end

  describe '#message' do
    let(:message) { 'this is an error' }

    subject { error.message }

    it 'is the error message' do
      expect(subject).to eq('this is an error')
    end
  end

  describe '#status_code' do
    let(:status_code) { 123 }

    subject { error.status_code }

    it 'is the status code' do
      expect(subject).to eq(123)
    end
  end
end
