class InsuredsController < ApplicationController
  def create
    insured = Insured.new(day_id: params[:day_id])
    if insured.save
      render json: {message: "Success"}
    end
  end

  def destroy
    insured = Insured.find(params[:id])
    begin insured.destroy
      render json: { message: "Deleted" }
    rescue
      redirect_to :back
    end
  end
end
