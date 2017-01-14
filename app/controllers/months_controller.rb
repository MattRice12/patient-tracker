class MonthsController < ApplicationController
  def index
    months = Month.where(user: current_user).includes(:days)
    render locals: {months: months}
  end

  def show
    month = Month.find(params.fetch(:id))
    render locals: {month: month}
  end
end
