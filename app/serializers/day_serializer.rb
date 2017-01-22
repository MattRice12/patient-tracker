class DaySerializer < ActiveModel::Serializer
  attributes :id,
             :month_id,
             :locked,
             :date,
             :day_name,
             :insureds,
             :uninsureds

  belongs_to :month

  def day_name
    object.date.strftime("%d")
  end

end
