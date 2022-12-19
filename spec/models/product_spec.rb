require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    subject(:product) { create(:product) }

    context 'when valid attributes' do
      it 'attributes valid' do
        expect(product).to be_valid
      end
    end

    context 'when invalid attributes' do
      it 'is not valid attribute name' do
        product.name = nil
        expect(product).to_not be_valid
      end

      it 'is not valid attribute description' do
        product.description = nil
        expect(product).to_not be_valid
      end

      it 'is not valid attribute type production' do
        product.type_product = nil
        expect(product).to_not be_valid
      end

      it 'is not valid attribute price' do
        product.price = nil
        expect(product).to_not be_valid
      end
    end
  end

  describe 'Scope' do 
    context 'when searching q ' do
      let(:product_one) { create(:product) }
      let(:scope) { Product::Record.q(product_one.name) }

      it { expect(scope).to include(product_one) }
    end
  end
end
