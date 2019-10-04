FactoryBot.define do
  
  factory :user do
    first_name { "Joe" }
    last_name { "Joe" }
    email {"joe@gmail.com"}
    password {"123123123"}
  end
end