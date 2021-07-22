class Admin::ApplicationsController < ApplicationsController
  def show
    @app = Application.find(params[:id])  
  end    

  def update
    @app = Application.find(params[:app_id]) 
    # require 'pry'; binding.pry
    if params[:status] == 'Accept'
      # @app.pet_status(params[:status])
      pet = @app.pets.find_by_id(params[:pet_id])
      pet.update(adoptable: false)
      redirect_to admin_application_path(@app, status: 'Accepted')
    elsif params[:status] == 'Reject'
      # @app.pet_status(params[:status])
      pet = @app.pets.find_by_id(params[:pet_id])
      redirect_to admin_application_path(@app, status: 'Rejected')
    end
  end
end