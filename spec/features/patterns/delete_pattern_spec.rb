require 'rails_helper'

# As a user
# I want to delete a particular pattern I created
# So that I can keep my set of patterns neat and organized

feature 'delete a pattern' do
  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as user
  end

  scenario 'delete a pattern that you created' do
    FactoryGirl.create(:pattern, user: user)
    visit patterns_path

    click_button 'Delete'

    expect(page).to have_content 'Pattern deleted'
  end

  scenario 'can\'t delete a pattern you didn\'t create' do
    FactoryGirl.create(:pattern)
    visit patterns_path
    expect(page).to_not have_content 'Delete'
  end
end
