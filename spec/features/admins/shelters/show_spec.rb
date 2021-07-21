require 'rails_helper'

RSpec.describe 'Admin Shelter Show' do
  before(:each) do
    @shelter = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)

    visit '/admin/shelters'
  end    

  describe 'Admin Shelter Show Page' do
    it 'Shows a shelters attributes' do
      
      expect(page).to have_content(@shelter.name)    
      expect(page).to have_content(@shelter.city)
    end    
  end
end