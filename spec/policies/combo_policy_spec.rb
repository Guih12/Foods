require 'rails_helper'

RSpec.describe ComboPolicy do
  let(:combo_policy) { described_class.new(user, combo) }
  let(:user) { create(:user, type_user: 0) }
  let(:combo) { create(:combo) }

  describe '#index' do
    subject { combo_policy.index? }
    context 'when user is provider' do
      it { is_expected.to be_truthy }
    end

    context 'when user is not provider' do
      let(:user) { create(:user) }
      it { is_expected.to be_falsey }
    end
  end

  describe '#show' do
    subject { combo_policy.show? }
    context 'when user is provider' do
      it { is_expected.to be_truthy }
    end

    context 'when user is not provider' do
      let(:user) { create(:user) }
      it { is_expected.to be_falsey }
    end
  end

  describe '#create' do
    subject { combo_policy.create? }

    context 'when user is provider' do
      it { is_expected.to be_truthy }
    end
    context 'when user is not provider' do
      let(:user) { create(:user) }
      it { is_expected.to be_falsey }
    end
  end

  describe '#update' do
    subject { combo_policy.update? }

    context 'when user is provider' do
      it { is_expected.to be_truthy }
    end

    context 'when user is not provider' do
      let(:user) { create(:user) }
      it { is_expected.to be_falsey }
    end
  end
end
