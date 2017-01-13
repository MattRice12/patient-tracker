class UninsuredsController < ApplicationController
  def create
    Uninsured.create!(day_id: params[:day_id])
    redirect_to :back
  end

  def destroy
    begin
      uninsured = Uninsured.find(params[:id])
      uninsured.destroy
      redirect_to :back
    rescue
      flash[:alert] = "You're clicking too fast to delete."
      redirect_to :back
    end
  end
end
