class DaySerializer < ActiveModel::Serializer
  attributes :id,
             :month_id,
             :locked,
             :date,
             :day_name,
             :insureds_count,
             :uninsureds_count,
             :insured_ids,
             :uninsured_ids

  belongs_to :month
  has_many :insureds
  has_many :uninsureds

  def insured_ids
    object.insureds.map {|ins| ins.id}
  end

  def uninsured_ids
    object.uninsureds.map {|ins| ins.id}
  end


  def day_name
    object.date.strftime("%d")
  end

  def insured_count
    if object.insureds_count.blank?
      return "0"
    else
      return object.insureds_count
    end
  end

  def uninsured_count
    if object.uninsureds_count.blank?
      return "0"
    else
      return object.uninsureds_count
    end
  end
end
