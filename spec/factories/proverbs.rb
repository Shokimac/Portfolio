FactoryBot.define do
    factory :proverb do
        user
        name { Faker::Lorem.characters(number:10) }
        body { Faker::Lorem.characters(number:25) }
        inteoduction { Faker::Lorem.characters(number:50) }
    end
end