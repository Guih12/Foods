require 'rails_helper'

RSpec.describe PlaceOrder, type: :model do
  describe 'Validations' do
    let(:place_order) { create(:place_order) }

    context 'when valid attributes' do
      it 'place order is valid' do
        expect(place_order).to be_valid
      end
    end

    context 'when invalid attributes' do
      before do
        place_order.user = nil
        place_order.restaurant = nil
        place_order.save
      end

      it 'fail craete place order' do
        expect(place_order).to_not be_valid
      end
    end
  end

  describe "#save" do
    let(:place_order) { create(:place_order) }

    context "when date set" do
      it 'set date' do
        expect { place_order.save }.not_to change { place_order.data }
      end
    end

    context 'when status set' do
      it 'set status' do
        expect { place_order.save }.not_to change { place_order.status }
      end

    end
  end
end
