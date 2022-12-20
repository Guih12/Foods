require 'rails_helper'

RSpec.describe Combo::Create do
  subject { Combo::Create.new(combo_attributes, Combo::Repository).persist}
  describe '.persist' do
    let(:combo) { create(:combo) }
    let(:product) { create(:product) }
    let(:restaurant) { create(:restaurant) }
    let(:combo_attributes) do
      {
        "name": 'combo_legal',
        "description": 'combo_nice',
        "price": 10,
        "restaurant_id": restaurant.id,
        "combo_items_attributes":[
          {
            "product_id": product.id
          }
        ]
      }
    end

    context 'when valid params' do
      it 'create combo' do
        expect(subject).to eq Combo::Record.last
      end
    end
  end
end
