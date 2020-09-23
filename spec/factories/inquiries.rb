FactoryBot.define do
    factory :inquiry do
        name { Faker::Lorem.characters(number:10) }
        message { Faker::Lorem.characters(number:50) }
        user
    end
end