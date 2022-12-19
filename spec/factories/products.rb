FactoryBot.define do
  factory :product, class: "Product::Record" do
    name { 'Lanche legal' }
    description { 'Um lanche muito bom' }
    type_product { :snack }
    price { 2 }
    restaurant { create(:restaurant) }
  end
end
