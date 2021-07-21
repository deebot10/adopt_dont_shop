require 'rails_helper'

RSpec.describe 'New Application Form' do
     
  it 'fails if any of the form is not filled in' do
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