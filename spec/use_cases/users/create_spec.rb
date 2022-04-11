require 'rails_helper'

RSpec.describe Users::Create do
  describe '.persist' do
    context 'when valid attributes' do
      let(:users_attributes) do
        {
          name: 'george',
          lastname: 'borsato',
          age: 20,
          email: 'george.lemos@gmail.com',
          password: '35462213'
        }
      end

      let(:subject) { Users::Create.new(users_attributes).persist }

      it 'create user' do
        expect(subject).to eq subject
      end
    end
  end
end
