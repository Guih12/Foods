FactoryBot.define do
  factory :place_order do
    name_user { "MyString" }
    cpf_user { "MyString" }
    data { "2022-04-05" }
    status { false }
    price { 1.5 }
    code { "MyString" }
  end
end
