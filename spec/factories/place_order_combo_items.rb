FactoryBot.define do
  factory :place_order_combo_item do
    place_order { create(:place_order) }
    combo { create(:combo) }
  end
end
