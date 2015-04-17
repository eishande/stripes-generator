require 'rails_helper'

RSpec.describe "patterns/index", type: :view do
  before(:each) do

  end

  it "renders a list of patterns" do
    render
    assert_select "tr>td", :text => "Cd".to_s, :count => 2
    assert_select "tr>td", :text => "..".to_s, :count => 2
  end
end
