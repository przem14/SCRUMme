require 'rails_helper'

RSpec.describe "boards/edit", :type => :view do
  before(:each) do
    @board = assign(:board, Board.create!(
      :team => nil
    ))
  end

  it "renders the edit board form" do
    render

    assert_select "form[action=?][method=?]", board_path(@board), "post" do

      assert_select "input#board_team_id[name=?]", "board[team_id]"
    end
  end
end
