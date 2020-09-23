FactoryBot.define do
    factory :dropped_letter do
        body { Faker::Lorem.characters(number:20) }
    end
end