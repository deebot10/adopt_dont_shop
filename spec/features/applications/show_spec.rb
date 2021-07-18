require 'rails_helper'

RSpec.describe 'Application Show' do
  before(:each) do
    @applicant = Application.create!(name: 'Dee', address: '123 Oak St.', city: 'Austin', state: 'Tx', zip_code: 13546, description: "I'd be a ok owner", status: 'Pending') 
    @shelter = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9) 
    @pet_1 = @applicant.pets.create!(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: @shelter.id)
    @pet_2 = @applicant.pets.create!(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: @shelter.id)

    visit application_path(@applicant)
  end
  
  # User Story1
  it 'shows an Application with attributes' do

    expect(page).to have_content(@applicant.name)
    expect(page).to have_content(@applicant.address)
    expect(page).to have_content(@applicant.city)
    expect(page).to have_content(@applicant.state)
    expect(page).to have_content(@applicant.zip_code)
    expect(page).to have_content(@applicant.description)
    expect(page).to have_content(@applicant.status)
  end

  it 'names all the pets for an applicant and links to show page' do
    
    expect(page).to have_content(@pet_1.name)
    expect(page).to have_content(@pet_2.name)

    click_link("#{@pet_1.name}")

    expect(current_path).to eq("/pets/#{@pet_1.id}")
  end
  
  #   As a visitor UserStory3
  # When I visit an application's show page
  # And that application has not been submitted,
  # Then I see a section on the page to "Add a Pet to this Application"
  # In that section I see an input where I can search for Pets by name
  # When I fill in this field with a Pet's name
  # And I click submit,
  # Then I am taken back to the application show page
  # And under the search bar I see any Pet whose name matches my search
  xit 'has a section to add a pet to an application' do
      
  end
end