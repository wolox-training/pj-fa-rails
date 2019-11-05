50000.times do
  Book.create(
    gender: Faker::Book.genre,
    author: Faker::Book.author,
    image: Faker::File.mime_type,
    title: Faker::Book.title,
    publisher: Faker::Book.publisher,
    year: Faker::Number.number(digits: 4)
  )
end
