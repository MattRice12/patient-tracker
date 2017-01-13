class InsuredsController < ApplicationController
  def create
    Insured.create!(day_id: params[:day_id])
    redirect_to :back
  end

  def destroy
    begin
      insured = Insured.find(params[:id])
      insured.destroy
      redirect_to :back
    rescue
      flash[:alert] = "You're clicking too fast to delete."
      redirect_to :back
    end
  end
end
