require 'rails_helper'

RSpec.describe Team, :type => :model do
  it { should respond_to?(:name) }

  it 'Should not create new team when give empty name' do
    teams = Team.all
    Team.create(name: '')

    expect(Team.all).to be == teams
  end

  it 'Should not create new team when give no name' do
    teams = Team.all
    Team.create()

    expect(Team.all).to be == teams
  end

  it 'Should has many users' do
    @team = Team.create(name: 'Team')
    user1 = User.create(email: 'user1@test.com', password: 'password', team: @team)
    user2 = User.create(email: 'user2@test.com', password: 'password', team: @team)

    expect(@team.users).to be == [user2, user1]
  end
end
