require 'rails_helper'

RSpec.describe 'Application Show' do
  before(:each) do
    @applicant = Application.create!(name: 'Dee', address: '123 Oak St.', city: 'Austin', state: 'Tx', zip_code: 13546, description: "I'd be a ok owner") 
    @shelter = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9) 
    @pet_1 = @applicant.pets.create!(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: @shelter.id)
    @pet_2 = @applicant.pets.create!(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: @shelter.id)

    visit application_path(@applicant)
  end
  
    #   As a visitor
    # When I visit an applications show page
    # Then I can see the following:

    # Name of the Applicant
    # Full Address of the Applicant including street address, city, state, and zip code
    # Description of why the applicant says they'd be a good home for this pet(s)
    # names of all pets that this application is for (all names of pets should be links to their show page)
    # The Application's status, either "In Progress", "Pending", "Accepted", or "Rejected"
  it 'shows an Application with attributes' do

    expect(page).to have_content(@applicant.name)
    expect(page).to have_content(@applicant.address)
    expect(page).to have_content(@applicant.city)
    expect(page).to have_content(@applicant.state)
    expect(page).to have_content(@applicant.zip_code)
    expect(page).to have_content(@applicant.description)
  end
end