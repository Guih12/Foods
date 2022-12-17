FactoryBot.define do
  factory :combo, class: "Combo::Record" do
    name { 'MyString' }
    description { 'Uma descricao' }
    price { 2 }
    restaurant { create(:restaurant) }
  end
end
