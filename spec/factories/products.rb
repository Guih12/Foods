FactoryBot.define do
  factory :product do
    name { "Lanche legal" }
    description { "Um lanche muito bom" }
    type_product { :snack }
    price { 10 }
  end
end
