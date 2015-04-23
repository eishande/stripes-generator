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

    select dataset.name, from: 'Dataset'

    click_button 'Create Pattern'

    expect(page).to have_content('Pattern was successfully created')
  end

  # pending 'when user signs up they can access the default datasets'
  #   user = FactoryGirl.create(:user)

  scenario 'creating a pattern renders the stripe visual', js:true do
     dataset = FactoryGirl.create(:dataset, user: user)
     visit root_path

     select dataset.name, from: 'Dataset'

     find('.pattern-submit').trigger('click')

     expect(page).to have_selector('rect')
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
