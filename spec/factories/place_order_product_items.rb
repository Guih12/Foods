FactoryBot.define do
  factory :place_order_product_item do
    place_order { create(:place_order) }
    product { create(:product) }
  end
end
