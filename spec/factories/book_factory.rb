FactoryBot.define do
  factory :book do
    gender { Faker::Book.genre }
    author { Faker::Book.author }
    image { Faker::File.mime_type }
    title { Faker::String.random(length: 25) }
    publisher { Faker::Book.publisher }
    year { Faker::Number.number(digits: 4) }
  end
end
