class DaysController < ApplicationController
  def show
    @day = Day.find(params.fetch(:id))
    render json: @day
  end

  def update
    day = Day.find(params.fetch(:id))
    if day.locked == true
      day.locked = false
    else
      day.locked = true
    end
    day.save
    redirect_to :back
  end
end
