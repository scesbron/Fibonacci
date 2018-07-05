require 'rails_helper.rb'

describe UserCreate do
  let(:form) { SignupStepOneForm.from_model(user) }

  context 'with an invalid form' do
    let(:user) { nil }
    it 'returns an invalid event' do
      expect(UserCreate.call(form).keys).to eq [:invalid]
    end
  end

  context 'with a valid form' do
    let(:user) do
      User.new(
        first_name: 'John',
        last_name: 'Doe',
        street_number: '1',
        street_name: 'Main street',
        zip_code: '99999',
        city: 'The city',
        email: 'john@doe.com',
        password: 'unkown'
      )
    end
    it 'returns an valid event' do
      expect(UserCreate.call(form).keys).to eq [:ok]
    end
    it 'returns the created user' do
      expect(UserCreate.call(form)[:ok].class).to eq User
    end
  end
end
