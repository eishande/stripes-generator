require 'rails_helper'

RSpec.describe "patterns/show", type: :view do
  before(:each) do
    @pattern = assign(:pattern, Pattern.create!(
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Cd/)
    expect(rendered).to match(/../)
  end
end
