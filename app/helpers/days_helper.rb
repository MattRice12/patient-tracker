module DaysHelper

  def day_name
    object.date.strftime("%d")
  end

  def insured_count(day)
    if day.insureds_count.blank?
      return 0
    else
      return day.insureds_count
    end
  end

  def uninsured_count(day)
    if day.uninsureds_count.blank?
      return 0
    else
      return day.uninsureds_count
    end
  end

end
