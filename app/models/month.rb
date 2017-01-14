class Month < ApplicationRecord
  default_scope { order('months.created_at') }

  has_many :days
  belongs_to :user
end
