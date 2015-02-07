class TeamsAndUsersAssociation < ActiveRecord::Migration
  def change
    create_table :users_teams, :id => false do |t|
      t.references :user
      t.references :team
    end
  end
end
