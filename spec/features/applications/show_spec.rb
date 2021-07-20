require 'rails_helper'

RSpec.describe 'Application Show' do
  before(:each) do
    @applicant = Application.create!(name: 'Dee', address: '123 Oak St.', city: 'Austin', state: 'Tx', zip_code: 13546, description: "I'd be a ok owner", status: 0) 
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
  
  #UserStory3
  it 'has a section to add a pet to an application' do
    applicant = Application.create!(name: 'Dee', address: '123 Oak St.', city: 'Austin', state: 'Tx', zip_code: 13546, description: "I'd be a ok owner", status: 0)
    shelter = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9) 
    pet = Pet.create!(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: shelter.id)
    
    visit application_path(applicant)

    expect(page).to_not have_content(pet.name)
    
    fill_in 'Name', with: 'Lucille Bald'
    click_button 'Submit'

    expect(page).to have_content(pet.name)
  end
  

  it 'can be case insensitive to search' do
    applicant = Application.create!(name: 'Dee', address: '123 Oak St.', city: 'Austin', state: 'Tx', zip_code: 13546, description: "I'd be a ok owner", status: 0)
    shelter = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9) 
    pet = Pet.create!(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: shelter.id)
    
    visit application_path(applicant)

    expect(page).to_not have_content(pet.name)
    
    fill_in 'Name', with: 'LuCilLE BAld'
    click_button 'Submit'

    expect(page).to have_content(pet.name)
  end

  describe 'submit an application' do
    it 'can submit once pets are added to an application' do

      expect(page).to have_content('Submit an Application')

      fill_in 'Description', with: 'I love Animals'
      click_button 'Submit'
      
      expect(current_path).to eq("/applications/#{@applicant}")

      expect(page).to have_content(@pet_1.name)
      expect(page).to have_content(@pet_1.name)
      expect(page).to have_content(@applicant.status == 'Pending')
    end
  end
end