require 'rails_helper'

RSpec.describe Product::Update do
  describe '.persist' do
    context 'when valid attributes' do
      let(:product) { create(:product) }
      let(:subject) { Product::Update.new(product, product_attributes) }
      let(:product_attributes) do
        {
          name: 'hamburguer 2',
          description: 'humburguer legal',
          type_product: :snack,
          price: 20
        }
      end

      it 'update product' do
        expect(subject.persist).to eq product
      end
    end
  end
end
