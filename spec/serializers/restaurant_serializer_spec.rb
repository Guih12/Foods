require 'rails_helper'

RSpec.describe RestaurantSerializer do
  let(:restaurant) { create(:restaurant) }

  describe '.serializable hash' do
    subject {described_class.new(restaurant).serializable_hash }


    it 'serializable id' do
      expect(subject[:data][:attributes][:id]).to eq restaurant.id
      expect(subject[:data][:attributes][:id]).to be_present
    end

    it 'serializable name' do
      expect(subject[:data][:attributes][:name]).to eq restaurant.name
      expect(subject[:data][:attributes][:name]).to be_present
    end

    it 'serializable number_phone' do
      expect(subject[:data][:attributes][:number_phone]).to eq restaurant.number_phone
      expect(subject[:data][:attributes][:number_phone]).to be_present
    end
  end
end