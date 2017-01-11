class Day < ApplicationRecord
  default_scope { order('days.created_at') }

  belongs_to :month
  has_many :patients


end
