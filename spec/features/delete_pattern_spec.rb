require 'rails_helper'

feature 'delete a pattern' do
  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as user
  end

  scenario 'delete a pattern that you created' do
    pattern = FactoryGirl.create(:pattern, user: user)
    visit pattern_path(pattern)

    click_button 'Delete'

    expect(page).to have_content 'Pattern deleted'
  end

  scenario 'can\'t delete a pattern you didn\'t create' do
    pattern = FactoryGirl.create(:pattern)
    visit pattern_path(pattern)
    expect(page).to_not have_content 'Delete'
  end
end
