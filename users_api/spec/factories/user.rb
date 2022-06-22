FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "rodfagui#{n}@gmail.com" }
    sequence(:username) { |n| "rodfagui#{n}" }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
