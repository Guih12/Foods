require 'rails_helper'

RSpec.describe Users::Update do
  describe '.persist' do
    context 'when valid attributes' do
      let(:user) { create(:user) }
      let(:users_attributes) do
        {
          name: 'george',
          lastname: 'borsato',
          age: 20,
          email: 'george.lemos@gmail.com',
          password: '35462213'
        }
      end

      let(:subject) { Users::Update.new(user, users_attributes).persist }

      it 'update user' do
        expect(subject).to eq subject
      end
    end
  end
end
