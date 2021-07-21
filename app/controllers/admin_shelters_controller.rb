class AdminSheltersController < ApplicationController
  def index  
    @shelters = Shelter.admin_order  
  end    

  def show
    @shelter = Shelter.find(params[:id])  
    # @shelter.info
  end
end