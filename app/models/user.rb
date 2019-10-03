class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :trackable, :lockable, :timeoutable and :omniauthable
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
end
