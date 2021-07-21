require 'rails_helper'

RSpec.describe 'Admin Index' do
  before(:each) do
    @shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @shelter_2 = Shelter.create(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)
    @shelter_3 = Shelter.create(name: 'Fancy pets of Colorado', city: 'Denver, CO', foster_program: true, rank: 10)

    @applicant_1 = Application.create!(name: 'Dee', address: '123 Oak St.', city: 'Austin', state: 'Tx', zip_code: 13546, description: "I'd be a ok owner", status: 1) 
    @applicant_2 = Application.create!(name: 'Zack', address: 'Zipline way', city: 'Dallas', state: 'Tx', zip_code: 52641, description: "I'd very good", status: 1) 
    @applicant_3 = Application.create!(name: 'Tyreses', address: 'Berry Dr.', city: 'Moscow', state: 'AL', zip_code: 80207, description: "I'd be alright", status: 0) 

    @pet_1 = @applicant_1.pets.create!(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: @shelter_1.id)
    @pet_2 = @applicant_2.pets.create!(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: @shelter_2.id)
    
    visit '/admin/shelters'
  end
  
  describe 'Admin Shelter Index' do
    it 'displays all shelters in the DB' do
      
      expect(@shelter_2.name).to appear_before(@shelter_3.name)
      expect(@shelter_3.name).to appear_before(@shelter_1.name)
      expect(@shelter_1.name).to_not appear_before(@shelter_2.name)
    end
  end

  describe 'Shelters with pending Applciations' do
    it 'displays shelters with applications pending' do

      within('section#pending') do
        
        expect(page).to have_content('Shelters with Pending Applications')

        # expect(page).to have_content(@applicant_1.name)
        # expect(page).to have_content(@applicant_2.name)
      end
    end
  end
end