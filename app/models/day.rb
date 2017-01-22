class Day < ApplicationRecord
  default_scope { order('days.created_at') }

  belongs_to :month

  # validates :insureds, numericality: { greater_than_or_equal_to: 0 }
  # validates :uninsureds, numericality: { greater_than_or_equal_to: 0 }
end
