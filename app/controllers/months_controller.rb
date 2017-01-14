class MonthsController < ApplicationController
  def index
    months = Month.includes(:days).where(user: current_user)
    render locals: {months: months}
  end

  def show
    month = Month.find(params.fetch(:id))
    render locals: {month: month}
  end
end
