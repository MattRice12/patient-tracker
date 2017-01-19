class Day < ApplicationRecord
  default_scope { order('days.created_at') }

  belongs_to :month
  has_many :insureds
  has_many :uninsureds
end
