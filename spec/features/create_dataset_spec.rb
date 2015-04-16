require 'rails_helper'

feature 'create a new dataset' do
  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as user
  end
# As a user
# I want to input some data
# So that I can create a pattern from it

  scenario 'create a new dataset' do
    visit root_path

    click_link 'Add a new dataset'
    fill_in 'Name', with: "Temperatures for 2013"
    fill_in 'Data', with: "{45, 32, 34, 43, 40}"
    click_button 'Create Dataset'

    expect(page).to have_content('Dataset was successfully created')
  end

  scenario 'fail to add a new dataset due to invalid input' do
    visit root_path

    click_link 'Add a new dataset'
    fill_in 'Name', with: "Temperatures for 2013"
    fill_in 'Data', with: ""
    click_button 'Create Dataset'

    expect(page).to have_content('Data can\'t be blank')
  end

  scenario 'create a new dataset when you don\'t start out logged in' do
    visit root_path
    sign_out_as(user)
    click_link 'Add a new dataset'
    expect(page).to have_content('Sign In')

    fill_in 'Email', with: 'nibbler@planetexpress.com'
    fill_in 'Password', with: 'futurama'

    click_link 'Log In'

    expect(page).to have_content 'Sign Out'
  end
end
