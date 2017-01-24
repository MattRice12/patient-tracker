class UserSerializer < ActiveModel::Serializer
  attributes :id

  has_many :months, dependent: :destroy

end
