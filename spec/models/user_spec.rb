require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject(:user) { create(:user) }

    context 'when valid attributes' do
      it 'valid attribute' do
        expect(user).to be_valid
      end
    end

    context 'when invalid attributes' do
      it 'is not valid attribute name' do
        user.name = nil
        expect(user).to_not be_valid
      end

      it 'is not valid attribute lastname' do
        user.lastname = nil
        expect(user).to_not be_valid
      end

      it 'is not valid attribute age' do
        user.age = nil
        expect(user).to_not be_valid
      end

      it 'is not valid attribute email' do
        user.email = nil
        expect(user).to_not be_valid
      end
    end
  end
end
