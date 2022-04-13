require 'rails_helper'

RSpec.describe RestaurantPolicy do
  let(:restaurant_policy) { described_class.new(user, restaurant) }
  let(:restaurant) { create(:restaurant) }
  let(:user) { create(:user, type_user: 1) }

  describe '#index' do
    subject { restaurant_policy.index? }

    context 'when user is consumer' do
      it { is_expected.to be_truthy }
    end

    context 'when user is not consumer' do
      let(:user) { create(:user, type_user: 0) }
      it { is_expected.to be_falsey}
    end
  end

  describe '#show' do
    subject { restaurant_policy.show? }

    context 'when user is consumer' do
      it { is_expected.to be_truthy }
    end

    context 'when user is not consumer' do
      let(:user) { create(:user, type_user: 0) }
      it { is_expected.to be_falsey}
    end
  end
end