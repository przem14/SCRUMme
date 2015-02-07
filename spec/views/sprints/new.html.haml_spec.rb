require 'rails_helper'

RSpec.describe "sprints/new", :type => :view do
  before(:each) do
    assign(:sprint, Sprint.new(
      :board => nil
    ))
  end

  it "renders new sprint form" do
    render

    assert_select "form[action=?][method=?]", sprints_path, "post" do

      assert_select "input#sprint_board_id[name=?]", "sprint[board_id]"
    end
  end
end
