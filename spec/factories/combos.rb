FactoryBot.define do
  factory :combo do
    name { 'MyString' }
    description { 'Uma descricao' }
    price { 2 }
    restaurant { create(:restaurant) }
  end
end
