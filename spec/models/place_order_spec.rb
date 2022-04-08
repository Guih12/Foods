require 'rails_helper'

RSpec.describe PlaceOrder, type: :model do
  describe 'Validations' do
    context 'when valid attributes' do
      let(:place_order) { create(:place_order) }

      it 'place order is valid' do
        expect(place_order).to be_valid
      end
    end

    context 'when invalid attributes' do
      let(:place_order) { create(:place_order) }
      it 'is not valid attribute nome user' do
        place_order.name_user = nil
        expect(place_order).to_not be_valid
      end

      it 'is not valid attribute cpf user' do
        place_order.cpf_user = nil
        expect(place_order).to_not be_valid
      end
    end
  end
end
