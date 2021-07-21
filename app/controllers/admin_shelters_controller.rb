class AdminSheltersController < ApplicationController
  def index  
    @shelters = Shelter.admin_order  
  end    
end