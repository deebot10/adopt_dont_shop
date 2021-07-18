class ApplicationsController < ApplicationController
  def show
    @applicant = Application.find(params[:id])    
  end    

  def new;end

  def create
    applicant = Application.create!(applicant_params)
    redirect_to "/applications/#{applicant.id}"     
  end

  private
  def applicant_params
    params.permit(:name, :address, :city, :state, :zip_code)    
  end
end