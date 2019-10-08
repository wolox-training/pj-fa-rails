class BookSerializer < ActiveModel::Serializer
  attributes :id, :gender, :author, :image, :title, :publisher, :year
  has_many :rents
end
