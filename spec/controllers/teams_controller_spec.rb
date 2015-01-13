require 'rails_helper'

RSpec.describe TeamsController, :type => :controller do
  it 'Should render index' do
    get :index
    expect(response).to render_template('index')
  end
end
