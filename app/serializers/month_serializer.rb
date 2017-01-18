class MonthSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name

  has_many :days
  belongs_to :user
end
