class InsuredSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :day
end
