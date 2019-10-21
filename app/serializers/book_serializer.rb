class BookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :image, :publisher, :year, :gender, :created_at, :updated_at
end
