require 'rails_helper'

RSpec.describe "patterns/edit", type: :view do
  before(:each) do

  end

  it "renders the edit pattern form" do
    render

    assert_select "form[action=?][method=?]", pattern_path(@pattern), "post" do

      assert_select "input#pattern_cd[name=?]", "pattern[cd]"

      assert_select "input#pattern_..[name=?]", "pattern[..]"
    end
  end
end
