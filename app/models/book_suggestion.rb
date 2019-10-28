class BookSuggestion < ApplicationRecord
  # Relations
  belongs_to :user, optional: true

  # Validations
  validates :author, :title, :link, :publisher, :year, presence: true
end
