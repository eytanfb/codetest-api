FactoryBot.define do
  factory :todo do
    description { Faker::Lorem.word }
    done { false }
  end
end
