require 'rails_helper'

RSpec.describe TeamsController, :type => :controller do
  it 'Should render index' do
    get :index
    expect(response).to render_template('index')
  end

  it 'Should render new' do
    get :new
    expect(response).to render_template('new')
  end
end
