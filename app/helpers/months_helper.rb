module MonthsHelper
  def day_name(day)
    day.date.strftime("%d")
  end
end
