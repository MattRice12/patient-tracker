class UninsuredsController < ApplicationController
  def create
    Uninsured.create!(day_id: params[:day_id])
    redirect_to :back
  end

  def destroy
    uninsured = Uninsured.find(params[:id])
    if uninsured.destroy
      redirect_to :back
    else
      flash[:alert] = "Failed to Delete Patient"
      redirect_to :back
    end
  end
end
