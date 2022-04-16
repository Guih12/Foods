require 'rails_helper'

RSpec.describe PlaceOrderSerializer do
  let(:place_order) { create(:place_order) }
  let(:combo) { create(:combo) }
  let(:product) { create(:product) }

  before do
    place_order.place_order_combo_items_attributes = [ {combo_id: combo.id} ]
    place_order.place_order_product_items_attributes = [ {product_id: product.id} ]
    place_order.save
  end

  describe '.serializable_hash' do
    subject { described_class.new(place_order).serializable_hash }

    it 'serializable id' do
      expect(subject[:data][:attributes][:id]).to eq place_order.id
      expect(subject[:data][:attributes][:id]).to be_present
    end

    it 'serializable data' do
      expect(subject[:data][:attributes][:data]).to eq place_order.data
      expect(subject[:data][:attributes][:data]).to be_present
    end

    it 'serializable code' do
      expect(subject[:data][:attributes][:code]).to eq place_order.code
      expect(subject[:data][:attributes][:code]).to be_present
    end

    it 'serializable status' do
      expect(subject[:data][:attributes][:status]).to eq place_order.status
      expect(subject[:data][:attributes][:status]).to be_falsey
    end

    it 'serializable price' do
      expect(subject[:data][:attributes][:price]).to eq place_order.price
      expect(subject[:data][:attributes][:id]).to be_present
    end

    it 'serializable price with discount' do
      expect(subject[:data][:attributes][:price_with_discount]).to eq place_order.price_with_discount
      expect(subject[:data][:attributes][:price_with_discount]).to be_present
    end

    it 'serializable user' do
      expect(subject[:data][:attributes][:user]).to eq place_order.user
      expect(subject[:data][:attributes][:user]).to be_present
    end

    it 'serializable combos' do
      expect(subject[:data][:attributes][:combos]).to eq place_order.combos
      expect(subject[:data][:attributes][:combos]).to be_present
    end

    it 'serializable products' do
      expect(subject[:data][:attributes][:products]).to eq place_order.products
      expect(subject[:data][:attributes][:products]).to be_present
    end
  end
end