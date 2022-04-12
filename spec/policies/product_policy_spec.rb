require 'rails_helper'

RSpec.describe ProductPolicy do
  let(:policy) { described_class.new(user, product) }

  let(:user) { create(:user, type_user: 0) }
  let(:product) { create(:product) }
  describe '#index' do
    subject { policy.index? }

    context 'when user is provider' do
      it { is_expected.to be_truthy }
    end

    context 'when user is not provider' do
      let(:user) { create(:user) }
      it { is_expected.to be_falsey }
    end
  end

  describe '#show' do
    subject { policy.show? }

    context 'when user is provider' do
      it { is_expected.to be_truthy }
    end

    context 'when user is not provider' do
      let(:user) { create(:user) }

      it { is_expected.to be_falsey }
    end
  end

  describe '#create' do
    subject { policy.create? }

    context 'when user is provider' do
      it { is_expected.to be_truthy }
    end

    context 'when user is not provider' do
      let(:user) { create(:user) }
      it { is_expected.to be_falsey }
    end
  end

  describe '#update' do
    subject { policy.update? }

    context 'when user is provider' do
      it { is_expected.to be_truthy }
    end

    context 'when user is not provider' do
      let(:user) { create(:user) }
      it { is_expected.to be_falsey }
    end
  end
end
