class Rent < ApplicationRecord
  # Relations
  belongs_to :book
  belongs_to :user

  # Validations
  validates :user, :book, :start_date, :end_date, presence: true
end
