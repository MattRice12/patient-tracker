class DaysController < ApplicationController

  def update
    day = Day.find(params[:id])
    if day.locked == true
      day.locked = false
    else
      day.locked = true
    end
    day.save
    redirect_to :back
  end
end
