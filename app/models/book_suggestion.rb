class BookSuggestion < ApplicationRecord
  # Relations
  belongs_to :user

  # Validations
  validates :author, :title, :link, :publisher, :year, presence: true
end
