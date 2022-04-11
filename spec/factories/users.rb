FactoryBot.define do
  factory :user do
    name { 'George' }
    lastname { 'Borsato' }
    age { 22 }
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password { '35462213' }
    password_confirmation {'35462213'}
  end
end
