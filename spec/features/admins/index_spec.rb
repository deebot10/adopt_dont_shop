require 'rails_helper'

RSpec.describe 'Admin Index' do
  before(:each) do
    @shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @shelter_2 = Shelter.create(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)
    @shelter_3 = Shelter.create(name: 'Fancy pets of Colorado', city: 'Denver, CO', foster_program: true, rank: 10)

    visit '/admin/shelters'
  end
  
    #   As a visitor
    # When I visit the admin shelter index ('/admin/shelters')
    # Then I see all Shelters in the system listed in reverse alphabetical order by name
  it 'displays all shelters in the DB' do
    
    expect(@shlter_2.name).to appear_before(@shlter_3.name)
    expect(@shlter_3.name).to appear_before(@shlter_1.name)
    expect(@shlter_1.name).to_not appear_before(@shlter_2.name)
  end
end