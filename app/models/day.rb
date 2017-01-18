class Day < ApplicationRecord
  default_scope { order('days.created_at') }

  belongs_to :month
  has_many :insureds
  has_many :uninsureds

  def as_json(_= nil)
    super(include: [:insureds, :uninsureds])
  end
end
