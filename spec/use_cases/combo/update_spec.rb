require 'rails_helper'

RSpec.describe Combos::Update do
  subject { described_class.new(combo, **combo_attributes).persist }
  describe '.persist' do
    let(:combo) { create(:combo) }
    let(:product) { create(:product) }
    let(:combo_attributes) do
      {
        "name": 'combo_legal',
        "description": 'combo_nice',
        "price": 10,
        "combo_items_attributes": [{ "product_id": product.id }]
      }
    end

    context 'when valid params' do
      it 'update combo' do
        expect(combo).to eq subject
      end
    end
  end
end
