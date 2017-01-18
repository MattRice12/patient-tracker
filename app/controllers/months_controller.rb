class MonthsController < ApplicationController
  def index
    @months = Month.includes(days: [:insureds, :uninsureds]).where(user: current_user)
    # @months = Month.includes(:days).where(user: current_user)
    render locals: {months: @months}
    # render json: @months
  end

  def show
    # month = Month.includes(days: [:insureds, :uninsureds]).find(params.fetch(:id))
    month = Month.includes(:days).find(params.fetch(:id))
    render locals: {month: month}
  end
end
