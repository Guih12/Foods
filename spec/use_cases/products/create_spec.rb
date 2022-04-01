require 'rails_helper'

RSpec.describe Products::Create do
  describe '.persist' do
    context 'when valid attributes' do
      let(:product_params) do
        {
          name: 'hamburguer',
          description: 'humburguer legal',
          type_product: :snack,
          price: 20
        }
      end

      let(:subject) { Products::Create.new(product_params).persist }

      it 'create product' do
        expect(subject).to eq subject
      end
    end

    context 'when invalid attributes' do
      let(:product_params) do
        {
          name: nil,
          description: nil,
          type_product: nil,
          price: 20
        }
      end

      let(:subject) { Products::Create.new(product_params).persist }

      it 'return message error' do
        expect(subject.messages).to have_key(:name)
        expect(subject.messages).to have_key(:description)
        expect(subject.messages).to have_key(:type_product)
      end
    end
  end
end
