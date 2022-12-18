FactoryBot.define do
  factory :combo_item, class: "Combo::Item::Record" do
    combo { create(:combo) }
    product { create(:product) }
  end

  factory :combo_invalid, parent: :combo_item do
    combo { nil }
    product { nil }
  end
end
