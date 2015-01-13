require 'rails_helper'

RSpec.describe TeamsController, :type => :controller do
  it 'Should render index' do
    get :index
    expect(response).to render_template('index')
  end

  it 'Should render show' do
    team = Team.create(name: 'Team')

    get :show, :id => team.id
    expect(response).to render_template('show')
  end

  it 'Should render new' do
    get :new
    expect(response).to render_template('new')
  end

  it 'Should create new team when post new' do
    post :create, :team => {:name => 'Team'}

    team = assigns('team')

    expect(team).to_not be == nil
    expect(team).to be_kind_of(Team)
    expect(team.name).to be == 'Team'
    expect(Team.find(team)).to be_truthy
    expect(controller).to redirect_to team
  end

  it 'Should not create new team when give invalid params' do
    post :create, :team => {:name => ''}

    team = assigns('team')

    expect(team.id).to be_nil
    expect(controller).to render_template('new')
    expect(Team.all).equal? []
  end
end
