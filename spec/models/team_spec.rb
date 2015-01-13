require 'rails_helper'

RSpec.describe Team, :type => :model do
  before(:each) { @team = Team.create(name: 'Team') }

  it { should respond_to?(:name) }

  it 'Should has many users' do
    user1 = User.create(email: 'user1@test.com', password: 'password', team: @team)
    user2 = User.create(email: 'user2@test.com', password: 'password', team: @team)

    expect(@team.users).to be == [user2, user1]
  end
end
