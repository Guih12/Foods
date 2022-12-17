require 'rails_helper'

RSpec.describe Restaurant::Create do
  subject { described_class.new(restaurant_attributes, ::Restaurant::Repository).persist }

  let(:restaurant) { create(:restaurant) }

  let(:restaurant_attributes) do
    {
      name: restaurant.name,
      number_phone: restaurant.number_phone,
      user_id: restaurant.user.id
    }
  end

  describe '.persist' do
    context 'when valid attributes' do
      it 'create restaurant' do
        expect(subject).to eq subject
      end
    end

    context 'when invalid attributes' do
      let(:restaurant_attributes) do
        {
          name: nil,
          number_phone: nil,
          user_id: restaurant.user.id
        }
      end

      it 'return message errors' do
        expect(subject.messages).to have_key(:name)
        expect(subject.messages).to have_key(:number_phone)
      end
    end
  end
end
