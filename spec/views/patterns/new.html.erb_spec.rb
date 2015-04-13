require 'rails_helper'

RSpec.describe "patterns/new", type: :view do
  before(:each) do
    assign(:pattern, Pattern.new(
    ))
  end

  it "renders new pattern form" do
    render

    assert_select "form[action=?][method=?]", patterns_path, "post" do

      assert_select "input#pattern_cd[name=?]", "pattern[cd]"

      assert_select "input#pattern_..[name=?]", "pattern[..]"
    end
  end
end
