require 'rails_helper'

RSpec.describe "boards/show", :type => :view do
  before(:each) do
    @board = assign(:board, Board.create!(
      :team => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
