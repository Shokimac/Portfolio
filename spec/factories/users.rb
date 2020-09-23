FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number:10) }
    sequence(:email) { |n| "testuser#{n}@sample.com" }
    introduction { Faker::Lorem.characters(number:20) }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :user2, class:User do
    name { Faker::Lorem.characters(number:10) }
    sequence(:email) { |n| "testuser#{n}@sample.com" }
    introduction { Faker::Lorem.characters(number:20) }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :user3, class:User do
    name { Faker::Lorem.characters(number:10) }
    sequence(:email) { |n| "testuser#{n}@sample.com" }
    introduction { Faker::Lorem.characters(number:20) }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :user4, class:User do
    name { Faker::Lorem.characters(number:10) }
    sequence(:email) { |n| "testuser#{n}@sample.com" }
    introduction { Faker::Lorem.characters(number:20) }
    password { 'password' }
    password_confirmation { 'password' }
    delete_flg { true }
  end
end