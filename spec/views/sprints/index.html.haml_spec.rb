require 'rails_helper'

RSpec.describe "sprints/index", :type => :view do
  before(:each) do
    assign(:sprints, [
      Sprint.create!(
        :board => nil
      ),
      Sprint.create!(
        :board => nil
      )
    ])
  end

  it "renders a list of sprints" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
