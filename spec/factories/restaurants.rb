FactoryBot.define do
  factory :restaurant do
    name { 'restaurante legal' }
    number_phone { '67 35462213' }
    user { create(:user) }
  end
end
