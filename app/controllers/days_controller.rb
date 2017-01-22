class DaysController < ApplicationController
  def show
    @day = Day.find(params.fetch(:id))
    render json: @day
  end

  def update
    @day = Day.find(params.fetch(:id))
    if @day.update_attributes!(day_params)
      render json: @day
    end
  end

  private
  def day_params
    params.require(:days).permit(:locked, :insureds, :uninsureds)
  end
end
