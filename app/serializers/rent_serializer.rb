class RentSerializer < ActiveModel::Serializer
  attributes :id, :from, :to
  belongs_to :book
  belongs_to :user

  def from
    object.start_date
  end

  def to
    object.end_date
  end
end
