module MonthsHelper
  def day_name(day)
    day.date.strftime("%d")
  end

  def this_patient(day)
    # if day.patients.present?
    #   return day.patients.first
    # else
    #   return nil
    # end
    Day.patients.first
  end
end
