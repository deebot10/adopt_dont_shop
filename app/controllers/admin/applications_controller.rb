class Admin::ApplicationsController < ApplicationsController
  def show
    @app = Application.find(params[:id])  
  end    

  def update
    @app = Application.find(params[:app_id]) 
    # @app.update(status: 2)
    pet = @app.pets.find_by_id(params[:pet_id])
    pet.update(adoptable: false)
    redirect_to admin_application_path(@app)
  end
end