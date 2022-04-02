FactoryBot.define do
  factory :combo_item do
    combo { create(:combo) }
    product { create(:product) }
  end
end
