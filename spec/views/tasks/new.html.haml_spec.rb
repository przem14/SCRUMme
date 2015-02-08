require 'rails_helper'

RSpec.describe "tasks/new", :type => :view do
  before(:each) do
    assign(:task, Task.new(
      :sprint => nil,
      :user => nil,
      :title => "MyString",
      :description => "MyText",
      :estimate => 1,
      :remaining_time => 1
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input#task_sprint_id[name=?]", "task[sprint_id]"

      assert_select "input#task_user_id[name=?]", "task[user_id]"

      assert_select "input#task_title[name=?]", "task[title]"

      assert_select "textarea#task_description[name=?]", "task[description]"

      assert_select "input#task_estimate[name=?]", "task[estimate]"

      assert_select "input#task_remaining_time[name=?]", "task[remaining_time]"
    end
  end
end
