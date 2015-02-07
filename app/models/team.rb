class Team < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => "users_teams",
                                  :class_name => "User"

  validates :name, length: { minimum: 1 }
  validates :name, uniqueness: true
end
