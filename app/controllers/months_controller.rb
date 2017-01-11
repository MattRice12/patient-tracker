class MonthsController < ApplicationController
  def index
    months = Month.all.includes(days: [:patients])
    render locals: {months: months}
  end
end
