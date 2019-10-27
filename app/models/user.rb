class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :trackable, :lockable, :timeoutable and :omniauthable
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  # Relations
  has_many :rents, dependent: :destroy
  has_many :book_suggestions, dependent: :destroy

  # Validations
  validates :first_name, :last_name, presence: true
end
