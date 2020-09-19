FactoryBot.define do
    factory :post_comment do
        user
        proverb
        comment { Faker::Lorem.characters(number:10) }
    end
end