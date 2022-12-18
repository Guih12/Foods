require 'rails_helper'

RSpec.describe Combo::Update do
  subject { described_class.new(combo_id: combo.id, combo_attribute: combo_attributes, repository: Combo::Repository).persist }
  describe '.persist' do
    let(:combo) { create(:combo) }
    let(:product) { create(:product) }
    let(:combo_attributes) do
      {
        "name": 'combo_legal',
        "description": 'combo_nice',
        "price": 10
      }
    end

    context 'when valid params' do
      it 'update combo' do
        expect(combo).to eq subject
      end
    end
  end
end
