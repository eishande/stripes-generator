require 'rails_helper'

feature 'create a new pattern' do
  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as user
  end

  # As a user
  # I want to create a pattern from a dataset I inputted
  # So that I can see the resulting design
  # As a user
  # I want to select the colors for my pattern
  # So I can customize my design
  scenario 'create a new pattern with an existing dataset' do
    dataset = FactoryGirl.create(:dataset, user: user)

    visit root_path
    save_and_open_page
    select dataset.name, from: 'Dataset'

    fill_in 'Colors', with: "{#5C323E,
                               #A82743,
                               #E15E32,
                               #C0D23E,
                               #E5F04C}"

    click_button 'Create Pattern'

    expect(page).to have_content('Pattern was successfully created')
  end

  scenario 'creating a pattern renders the stripe visual' do
     dataset = FactoryGirl.create(:dataset, user:user)
     pattern = FactoryGirl.create(:pattern, user:user, dataset:dataset)
     expect(page).to have_selector('rect')
  end

  scenario 'fail to create a new pattern due to invalid input' do
    dataset = FactoryGirl.create(:dataset, user: user)

    visit root_path

    select dataset.name, from: 'Dataset'

    fill_in 'Colors', with: ""

    click_button 'Create Pattern'

    expect(page).to_not have_content('Pattern successfully created')
  #  expect(page).to_not have_selector('rect')
    expect(page).to have_content("Colors can't be blank")
  end
end

# As a user
# I want to view a particular pattern that I created
# So I can see its design

# As a user
# I want to update the dataset for a pattern I created
# So that I can make changes to its design

# As a user
# I want to delete a particular dataset I created
# So that I can keep my set of patterns neat and organized

# As a user
# I want to create a pattern from a dataset imported from an external source
# So I can see a design from a particular dataset I don't have locally
