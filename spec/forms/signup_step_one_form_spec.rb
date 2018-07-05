require 'rails_helper.rb'

describe SignupStepOneForm do
  subject { SignupStepOneForm.from_params(params) }
  let(:params) do
    {
      first_name: 'John',
      last_name: 'Doe',
      street_number: '1',
      street_name: 'Main street',
      zip_code: '99999',
      city: 'The city',
      email: 'john@doe.com',
      password: 'unkown'
    }
  end

  describe 'valid?' do
    context 'with valid params' do
      it 'returns true' do expect(subject.valid?).to be_truthy end
    end
    context 'with street number missing' do
      before { params.delete(:street_number) }
      it 'returns true' do expect(subject.valid?).to be_truthy end
    end
    context 'with first_name missing' do
      before { params.delete(:first_name) }
      it 'returns false' do expect(subject.valid?).to be_falsey end
    end
    context 'with invalid zip code' do
      before { params.merge!(zip_code: 'invalid') }
      it 'returns false' do expect(subject.valid?).to be_falsey end
    end
  end
end
