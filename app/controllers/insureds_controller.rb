class InsuredsController < ApplicationController
  def create
    Insured.create!(day_id: params[:day_id])
    redirect_to :back
  end

  def destroy
    insured = Insured.find(params[:id])
    if insured.destroy
      redirect_to :back
    else
      flash[:alert] = "Failed to Delete Patient"
      redirect_to :back
    end
  end
end
