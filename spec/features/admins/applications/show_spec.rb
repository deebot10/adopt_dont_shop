require 'rails_helper'

RSpec.describe 'Admin App Show' do
  before(:each) do
    @shelter = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)

    @applicant = Application.create!(name: 'Dee', address: '123 Oak St.', city: 'Austin', state: 'Tx', zip_code: 13546, description: "I'd be a ok owner", status: 1) 

    @pet_1 = @applicant.pets.create!(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: @shelter.id)
    @pet_2 = @applicant.pets.create!(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: @shelter.id)  

    visit admin_application_path(@applicant)
  end    
  
  describe 'Approving a Pet for Adoption' do
    it 'has a button to approve' do
      
        within("#pet-#{@pet_1.id}") do
           expect(page).to have_selector(:link_or_button, 'Accept Application')
           click_button 'Accept Application'
        end
        
        expect(current_path).to eq(admin_application_path(@applicant))
        save_and_open_page
       
       within("#pet-#{@pet_1.id}") do
          expect(page).to have_content('Accepted')
          expect(page).to_not have_selector(:link_or_button, 'Accept Application')
        end
    end
  end
end