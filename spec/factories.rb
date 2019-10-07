require 'faker'

FactoryBot.define do
  factory :rent do
    association :user
    association :book
    start_date { Faker::Date }
    end_date { Faker::Date }
  end

  factory :book do
    gender { Faker::Book.genre }
    author { Faker::Book.author }
    image { Faker::File.mime_type }
    title { Faker::Book.title }
    publisher { Faker::Book.publisher }
    year { Faker::Number.number(digits: 4) }
  end

  factory :user do
    first_name { Faker::Name.name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Number.number(digits: 9) }
  end
end
