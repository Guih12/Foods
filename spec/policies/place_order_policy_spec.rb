require 'rails_helper'

RSpec.describe PlaceOrderPolicy do
  let(:place_order_policy) { PlaceOrderPolicy.new(user, place_order) }
  let(:user) { create(:user, type_user: 1) }
  let(:place_order) { create(:place_order) }

  describe '#create?' do
    subject { place_order_policy.create? }
    context 'when user is consumer' do
      it { is_expected.to be_truthy }
    end

    context 'when user is not consumer' do
      let(:user) { create(:user, type_user: 0) }
      it { is_expected.to be_falsey }
    end
  end
end
