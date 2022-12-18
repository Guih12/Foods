require 'rails_helper'

RSpec.describe ComboSerializer do
  let(:combo) { create(:combo) }
  let(:product) { create(:product) }

  before do
    Combo::Item::Record.create(combo_id: combo.id, product_id: product.id)
  end

  describe '.serializable hash' do
    subject { described_class.new(combo).serializable_hash }

    it 'serializable id' do
      expect(subject[:data][:attributes][:id]).to eq combo.id
      expect(subject[:data][:attributes][:id]).to be_present
    end

    it 'serializable name' do
      expect(subject[:data][:attributes][:name]).to eq combo.name
      expect(subject[:data][:attributes][:name]).to be_present
    end

    it 'serializable description' do
      expect(subject[:data][:attributes][:description]).to eq combo.description
      expect(subject[:data][:attributes][:description]).to be_present
    end

    it 'seriazable price' do
      expect(subject[:data][:attributes][:price]).to eq combo.price
      expect(subject[:data][:attributes][:price]).to be_present
    end

    it 'serializable products' do
      expect(subject[:data][:attributes][:products]).to be_present
    end

    it 'serializable products name' do
      expect(subject[:data][:attributes][:products].first[:name]).to eq product.name
      expect(subject[:data][:attributes][:products].first[:name]).to be_present
    end
  end
end
