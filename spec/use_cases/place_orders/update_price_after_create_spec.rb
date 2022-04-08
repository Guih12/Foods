require 'rails_helper'

RSpec.describe PlaceOrders::UpdatePriceAfterCreate do
  let(:place_order) { create(:place_order) }
  let(:product) { create(:product) }
  let(:product_two) { create(:product) }

  let(:combo) { create(:combo) }
  let(:combo_two) { create(:combo) }

  describe '.update_price' do
    context 'when valid place order' do
      let(:update_price_after_create) { PlaceOrders::UpdatePriceAfterCreate.new(place_order) }

      before do
        place_order.place_order_combo_items_attributes = [{ combo_id: combo.id }]
        place_order.place_order_combo_items_attributes = [{ combo_id: combo_two.id }]

        place_order.place_order_product_items_attributes = [{ product_id: product.id }]
        place_order.place_order_product_items_attributes = [{ product_id: product_two.id }]

        place_order.save
      end

      it 'return true if update valid' do
        expect(update_price_after_create.update_price).to be_truthy
      end
    end
  end
end
