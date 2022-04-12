require 'rails_helper'


RSpec.describe ApplicationPolicy do
  subject(:aplication_policy) { described_class.new(user, record) }
  let(:user) { create(:user,  type_user: 0) }
  let(:record) { create(:combo) }

  describe '#permission' do
    subject { aplication_policy.permission?}
    it { is_expected.to be_truthy }
  end

  describe ApplicationPolicy::Scope do
    subject(:aplication_policy) { described_class.new(user, record) }
    let(:user) { create(:user,  type_user: 0) }
    let(:record) { create(:combo) }

    describe '#resolve' do
      subject { aplication_policy }

      it { is_expected.to be_truthy }
    end
  end
end