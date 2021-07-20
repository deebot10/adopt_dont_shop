class ApplicationsController < ApplicationController
  def show
    @applicant = Application.find(params[:id])   
    pet = Pet.find_pet(params[:name])
    if pet.present?
      @applicant.pets << pet
      @applicant.status = 1
    end 
  end    

  def new;end

  def create
    applicant = Application.new(applicant_params)
    if applicant.save
      redirect_to "/applications/#{applicant.id}"     
    else
      flash[:notice] = 'Application not created: Required information missing.'
      render :new
    end
  end

  private
  def applicant_params
    params.permit(:name, :address, :city, :state, :zip_code)    
  end
end