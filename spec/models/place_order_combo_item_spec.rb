require 'rails_helper'

RSpec.describe PlaceOrderComboItem, type: :model do
  subject { described_class.new(place_order_combo_item) }
  let(:place_order_combo_item) { create(:place_order_combo_item) }

  describe 'Validations' do
    context 'when valid attributes' do
      it 'place order combo item is valid' do
        expect(place_order_combo_item).to be_valid
      end
    end
  end
end
