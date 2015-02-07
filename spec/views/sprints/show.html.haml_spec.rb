require 'rails_helper'

RSpec.describe "sprints/show", :type => :view do
  before(:each) do
    @sprint = assign(:sprint, Sprint.create!(
      :board => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
