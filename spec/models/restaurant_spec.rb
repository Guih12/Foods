require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  let(:restaurant) { create(:restaurant) }

  describe 'Validations' do
    context 'when valid attributes' do
      it 'valid restaurants' do
        expect(restaurant).to be_valid
      end
    end

    context 'when invalid attributes' do
      it 'is not valid name attribute' do
        restaurant.name = nil
        expect(restaurant).to_not be_valid
      end

      it 'is not valid number_phone attribute' do
        restaurant.number_phone = nil
        expect(restaurant).to_not be_valid
      end
    end
  end
end
