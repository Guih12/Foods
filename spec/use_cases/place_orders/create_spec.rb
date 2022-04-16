require 'rails_helper'

RSpec.describe PlaceOrders::Create do
  describe '.persist' do
    let(:place_order) { create(:place_order) }
    let(:product) { create(:product) }
    let(:product_two) { create(:product) }
    let(:user) { create(:user) }
    let(:restaurant) { create(:restaurant) }
    let(:combo) { create(:combo) }
    let(:combo_two) { create(:combo) }

    let(:place_order_create) { PlaceOrders::Create.new(params).persist }

    let(:params) do
      {
        "user_id": user.id,
        "restaurant_id": restaurant.id,
        "place_order_combo_items_attributes": [
          {
            combo_id: combo.id
          },
          {
            combo_id: combo_two.id
          }
        ],
        "place_order_product_items_attributes": [
          {
            product_id: product.id
          },
          {
            product_id: product_two.id
          }
        ]
      }
    end

    context 'when params valid' do
      it 'return instance placeOrders' do
        expect(place_order_create).to eq place_order_create
      end
    end

    context 'when params invalid' do
      let(:place_order_create) { PlaceOrders::Create.new(params).persist }

      let(:params) do
        {
          "place_order_combo_items_attributes": [],
          "place_order_product_items_attributes": []
        }
      end

      it 'return message errors' do
        expect(place_order_create.messages).to have_key(:user)
        expect(place_order_create.messages).to have_key(:restaurant)
      end
    end
  end
end
