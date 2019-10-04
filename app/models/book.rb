class Book < ApplicationRecord
  validates :gender, :author, :image, :title, :publisher, :year, presence: true
end
