FactoryBot.define do
  factory :book_suggestion do
    user
    synopsis { Faker::String.random(length: 8) }
    price { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    author { Faker::Book.author }
    title { Faker::Book.title }
    link { Faker::String.random(length: 8) }
    publisher { Faker::Book.publisher }
    year { Faker::Number.number(digits: 4) }
  end
end
