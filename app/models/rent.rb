class Rent < ApplicationRecord
  # Relations
  belongs_to :user
  belongs_to :book

  # Validations
  validates :user, :book, :start_date, :end_date, presence: true
end
