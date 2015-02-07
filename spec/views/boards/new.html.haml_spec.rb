require 'rails_helper'

RSpec.describe "boards/new", :type => :view do
  before(:each) do
    assign(:board, Board.new(
      :team => nil
    ))
  end

  it "renders new board form" do
    render

    assert_select "form[action=?][method=?]", boards_path, "post" do

      assert_select "input#board_team_id[name=?]", "board[team_id]"
    end
  end
end
