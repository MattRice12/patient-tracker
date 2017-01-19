class MonthsController < ApplicationController
  def index
    @months = Month.includes(:days).where(user: current_user)
    render locals: {months: @months}
  end

  def show
    month = Month.includes(:days).find(params.fetch(:id))
    render locals: {month: month}
  end
end
