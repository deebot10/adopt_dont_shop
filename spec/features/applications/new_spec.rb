require 'rails_helper'

RSpec.describe 'New Application Form' do
    #   As a visitor
    # When I visit the new application page
    # And I fail to fill in any of the form fields
    # And I click submit
    # Then I am taken back to the new applications page
    # And I see a message that I must fill in those fields.  
  it 'fails if any of the form is not filled in' do
    @applicant = Application.create!(name: 'Dee', address: '123 Oak St.', city: 'Austin', state: 'Tx', zip_code: 13546, description: "I'd be a ok owner", status: 0) 
    @shelter = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9) 
    @pet_1 = @applicant.pets.create!(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: @shelter.id)
    @pet_2 = @applicant.pets.create!(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: @shelter.id)

    visit new_application_path

    fill_in 'Name', with: 'Dee'
    fill_in 'Address', with: '561561'
    fill_in 'City', with: 'Dallberry'
    fill_in 'State', with: 'DF'
    fill_in 'Zip Code', with: 
    click_button("Submit")

    expect(page).to have_content('Application not created: Required information missing.')
  end    
end