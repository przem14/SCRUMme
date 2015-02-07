require 'rails_helper'

RSpec.describe "boards/index", :type => :view do
  before(:each) do
    assign(:boards, [
      Board.create!(
        :team => nil
      ),
      Board.create!(
        :team => nil
      )
    ])
  end

  it "renders a list of boards" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
