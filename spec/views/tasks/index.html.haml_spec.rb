require 'rails_helper'

RSpec.describe "tasks/index", :type => :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
        :sprint => nil,
        :user => nil,
        :title => "Title",
        :description => "MyText",
        :estimate => 1,
        :remaining_time => 2
      ),
      Task.create!(
        :sprint => nil,
        :user => nil,
        :title => "Title",
        :description => "MyText",
        :estimate => 1,
        :remaining_time => 2
      )
    ])
  end

  it "renders a list of tasks" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
