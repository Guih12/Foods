require 'rails_helper'


RSpec.describe Combos::SearchCombo do
  subject { described_class.new(combo.name).search }
  let(:combo) { create(:combo) }

  describe '.search' do
    context 'when valid params search' do
      it "return combos" do
        expect(subject).to_not be_empty
      end
    end

    context 'when invalid params search' do
      subject { described_class.new('').search }
      it 'return array empty' do
        expect(subject).to be_empty
      end
    end
  end
end