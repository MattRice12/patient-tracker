class MonthsController < ApplicationController
  def index
    months = Month.all
    render locals: {months: months}
  end
end
