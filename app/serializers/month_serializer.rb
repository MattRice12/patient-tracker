class MonthSerializer < ActiveModel::Serializer
  attributes :id

  has_many :days
  belongs_to :user
end
