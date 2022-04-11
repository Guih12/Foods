require 'rails_helper'

RSpec.describe Combos::Create do
  subject(:crate_combo) { Combos::Create.new(combo_attributes).persist }
  let(:product) { create(:product) }
  let(:combo) { create(:combo) }
  let(:restaurant) { create(:restaurant) }

  let(:combo_attributes) do
    {
      "name": combo.name,
      "description": combo.description,
      "price": combo.price,
      "restaurant_id": restaurant.id,
      "combo_items_attributes": [{ "product_id": product.id }]
    }
  end

  describe '.persist' do
    context 'when valid params' do
      it 'create combo' do
        expect(subject).to eq subject
      end
    end

    context 'when invalid params' do
      let(:combo_attributes) do
        {
          "name": nil,
          "description": nil,
          "price": combo.price,
          "combo_items_attributes": [{ "product_id": product.id }]
        }
      end
      it 'return message errors' do
        expect(subject.messages).to have_key(:name)
        expect(subject.messages).to have_key(:description)
      end
    end
  end
end
