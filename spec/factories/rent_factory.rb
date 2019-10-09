FactoryBot.define do
  factory :rent do
    user
    book
    start_date { Faker::Date }
    end_date { Faker::Date }
  end
end
