class Team < ActiveRecord::Base
  has_many :users

  validates :name, length: { minimum: 1 }
  validates :name, uniqueness: true
end
