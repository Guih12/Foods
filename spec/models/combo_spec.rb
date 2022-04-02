require 'rails_helper'

RSpec.describe Combo, type: :model do
  describe "Validations" do
    context 'when valid attributes' do
      let(:combo) { create(:combo) }
      it 'como is valid' do
        expect(combo).to be_valid
      end
    end

    context 'when invalid attributes' do
      let(:combo) { create(:combo) }
      it 'is not valid attribute name' do
        combo.name = nil
        expect(combo).to_not be_valid
      end

      it 'is not valid attribute description' do
        combo.description = nil
        expect(combo).to_not be_valid
      end
    end
  end
end
