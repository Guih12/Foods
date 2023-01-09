require 'rails_helper'

RSpec.describe PlaceOrder::CalculatePrice do
  let(:place_order) { create(:place_order) }
  let(:product) { create(:product) }
  let(:product_two) { create(:product) }

  let(:combo) { create(:combo) }
  let(:combo_two) { create(:combo) }

  describe '.calculate_total' do
    let(:calculate_price) { PlaceOrder::CalculatePrice.new(place_order) }
    let(:total_combo) { place_order.combos.map(&:price).sum }
    let(:total_products) { place_order.products.map(&:price).sum.to_f }
    let(:price_total) { total_combo + total_products }

    before do
      place_order.place_order_combo_items_attributes = [{ combo_id: combo.id }]
      place_order.place_order_combo_items_attributes = [{ combo_id: combo_two.id }]

      place_order.place_order_product_items_attributes = [{ product_id: product.id }]
      place_order.place_order_product_items_attributes = [{ product_id: product_two.id }]

      place_order.save
    end

    it 'return value 8' do
      expect(calculate_price.calculate_total).to eq price_total
    end
  end

  describe '.calculate_with_discount' do
    let(:calculate_price) { PlaceOrder::CalculatePrice.new(place_order) }
    let(:total_combo) { place_order.combos.map(&:price).sum }
    let(:total_products) { place_order.products.map(&:price).sum.to_f }
    let(:price_total) { total_combo + total_products }
    let(:calculate_discount) { PlaceOrder::CalculateDiscount.new(place_order).calculate_discount }

    let(:price_with_discount) { price_total - (price_total * calculate_discount) }

    before do
      place_order.place_order_combo_items_attributes = [{ combo_id: combo.id }]
      place_order.place_order_combo_items_attributes = [{ combo_id: combo_two.id }]

      place_order.place_order_product_items_attributes = [{ product_id: product.id }]
      place_order.place_order_product_items_attributes = [{ product_id: product_two.id }]

      place_order.save
    end

    it 'return price with discount 6.64' do
      expect(calculate_price.calculate_price_with_discount).to eq price_with_discount
    end
  end
end
