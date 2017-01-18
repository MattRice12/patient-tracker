class UninsuredSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :day
end
