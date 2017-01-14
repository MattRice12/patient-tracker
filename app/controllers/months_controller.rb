class MonthsController < ApplicationController
  def index
    months = Month.where(user: current_user).includes(:days)
    render locals: {months: months}
  end
end
