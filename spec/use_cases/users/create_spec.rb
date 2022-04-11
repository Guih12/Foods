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

    context 'when invalid attributes' do
      let(:users_attributes) do
        {
          name: nil,
          lastname: nil,
          age: nil,
          email: 'george.lemos@gmail.com',
          password: '35462213'
        }
      end

      let(:subject) { Users::Create.new(users_attributes).persist }

      it 'return message error' do
        expect(subject.messages).to have_key(:name)
        expect(subject.messages).to have_key(:lastname)
        expect(subject.messages).to have_key(:age)
      end
    end
  end
end
