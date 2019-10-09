class Book < ApplicationRecord
  # Relations
  has_many :rents, dependent: :destroy

  # Validations
  validates :gender, :author, :image, :title, :publisher, :year, presence: true
end
