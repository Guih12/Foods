FactoryBot.define do
  factory :product do
    name { "Lanche legal" }
    description { "Um lanche muito bom" }
    type_product { "lanche" }
    price { 10 }
  end
end
