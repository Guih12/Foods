require 'rails_helper'

RSpec.describe PlaceOrders::CalculateDiscount do
  let(:place_order) { create(:place_order) }
  let(:product) { create(:product) }
  let(:product_two) { create(:product) }

  let(:combo) { create(:combo) }
  let(:combo_two) { create(:combo) }

  describe '.verification_combo' do
    let(:place_order_calculate_discount) { PlaceOrders::CalculateDiscount.new(place_order) }

    context 'when place order contains two combos' do
      before do
        place_order.place_order_combo_items_attributes = [{ combo_id: combo.id }]
        place_order.place_order_combo_items_attributes = [{ combo_id: combo_two.id }]

        place_order.save
      end

      it 'return true' do
        expect(place_order_calculate_discount.verification_combo).to be_truthy
      end
    end

    context 'when place place order not have combos' do
      it 'return false' do
        expect(place_order_calculate_discount.verification_combo).to be_falsey
      end
    end
  end

  describe '.verification_lanche equal 2' do
    let(:place_order_calculate_discount) { PlaceOrders::CalculateDiscount.new(place_order) }

    context 'when place order contains two lanches' do
      before do
        place_order.place_order_product_items_attributes = [{ product_id: product.id }]
        place_order.place_order_product_items_attributes = [{ product_id: product_two.id }]

        place_order.save
      end

      it 'return true' do
        expect(place_order_calculate_discount.verification_lanche).to be_truthy
      end
    end

    context 'when place order not contains two lanches' do
      it 'return false' do
        expect(place_order_calculate_discount.verification_lanche).to be_falsey
      end
    end
  end

  describe '.verification_lanche_and_combo' do
    let(:place_order_calculate_discount) { PlaceOrders::CalculateDiscount.new(place_order) }

    context 'when place order contains two combos and two lanches' do
      before do
        place_order.place_order_combo_items_attributes = [{ combo_id: combo.id }]
        place_order.place_order_combo_items_attributes = [{ combo_id: combo_two.id }]

        place_order.place_order_product_items_attributes = [{ product_id: product.id }]
        place_order.place_order_product_items_attributes = [{ product_id: product_two.id }]

        place_order.save
      end

      it 'return true' do
        expect(place_order_calculate_discount.verification_combo_and_lanche).to be_truthy
      end
    end

    context 'when place order not contains combos and lanches' do
      it 'return false' do
        expect(place_order_calculate_discount.verification_combo_and_lanche).to be_falsey
      end
    end
  end

  describe '.calculate_discount' do
    let(:place_order_calculate_discount) { PlaceOrders::CalculateDiscount.new(place_order) }

    context 'when contains two combos and two lances' do
      before do
        place_order.place_order_combo_items_attributes = [{ combo_id: combo.id }]
        place_order.place_order_combo_items_attributes = [{ combo_id: combo_two.id }]

        place_order.place_order_product_items_attributes = [{ product_id: product.id }]
        place_order.place_order_product_items_attributes = [{ product_id: product_two.id }]

        place_order.save
      end

      it 'return 17% discount' do
        expect(place_order_calculate_discount.calculate_discount).to eq 0.17
      end
    end

    context 'when contains two combos' do
      before do
        place_order.place_order_combo_items_attributes = [{ combo_id: combo.id }]
        place_order.place_order_combo_items_attributes = [{ combo_id: combo_two.id }]

        place_order.save
      end
      it 'return 10% of discount' do
        expect(place_order_calculate_discount.calculate_discount).to eq 0.10
      end
    end

    context 'when contains two lanches' do
      before do
        place_order.place_order_product_items_attributes = [{ product_id: product.id }]
        place_order.place_order_product_items_attributes = [{ product_id: product_two.id }]

        place_order.save
      end

      it 'return 5% of discount' do
        expect(place_order_calculate_discount.calculate_discount).to eq 0.05
      end
    end
  end
end
