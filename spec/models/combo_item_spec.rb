require 'rails_helper'

RSpec.describe Combo::Item::Record, type: :model do
  describe 'Validations' do
    context 'when valid attributes' do
      let(:combo_item) { create(:combo_item) }
      it 'valid combo_item' do
        expect(combo_item).to be_valid
      end
    end
  end
end
