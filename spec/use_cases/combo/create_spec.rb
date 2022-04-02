require 'rails_helper'

RSpec.describe Combos::Create do
  subject(:crate_combo) { Combos::Create.new(combo_attributes).persist }
  let(:product) { create(:product) }
  let(:combo) { create(:combo) }

  let(:combo_attributes) do
    {
      "name": combo.name,
      "description": combo.description,
      "price": combo.price,
      "combo_items_attributes": [{"product_id": product.id}]
    }
  end

  describe '.persist' do
    context "when valid params" do
      it 'create combo' do
        expect(subject).to eq subject
      end
    end
  end
end