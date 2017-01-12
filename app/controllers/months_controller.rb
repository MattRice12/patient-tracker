class MonthsController < ApplicationController
  def index
    months = Month.all.includes(:days)
    render locals: {months: months}
  end
end
