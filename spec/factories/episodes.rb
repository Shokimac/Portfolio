FactoryBot.define do
    factory :episode do
        user
        title { Faker::Lorem.characters(number:10) }
        body { Faker::Lorem.characters(number:20) }
    end
end