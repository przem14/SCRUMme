require 'rails_helper'

RSpec.describe Team, :type => :model do
 before(:each) { @user = Team.new(name: 'Team') }

 it { should respond_to?(:name) }
end
