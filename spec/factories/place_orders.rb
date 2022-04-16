FactoryBot.define do
  factory :place_order do
    data { '2022-04-05' }
    status { false }
    price { 1.5 }
    price_with_discount { 6 }
    code { 'MyString' }
    user { create(:user) }
    restaurant { create(:restaurant) }
  end
end
