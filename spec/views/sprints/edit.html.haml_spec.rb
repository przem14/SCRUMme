require 'rails_helper'

RSpec.describe "sprints/edit", :type => :view do
  before(:each) do
    @sprint = assign(:sprint, Sprint.create!(
      :board => nil
    ))
  end

  it "renders the edit sprint form" do
    render

    assert_select "form[action=?][method=?]", sprint_path(@sprint), "post" do

      assert_select "input#sprint_board_id[name=?]", "sprint[board_id]"
    end
  end
end
