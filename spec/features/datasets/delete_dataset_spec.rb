require 'rails_helper'

# As a user
# I want to delete a particular dataset I created
# So that I can keep my set of patterns neat and organized

feature 'delete a dataset' do
  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as user
  end

  scenario 'delete a dataset that you created' do
    FactoryGirl.create(:dataset, user: user)
    visit datasets_path

    click_button 'Delete'

    expect(page).to have_content 'Dataset deleted'
  end

  scenario 'can\'t delete a dataset you didn\'t create' do
    FactoryGirl.create(:dataset)
    visit datasets_path
    expect(page).to_not have_content 'Delete'
  end

  pending 'when a dataset is deleted all associated patterns are deleted'
end
