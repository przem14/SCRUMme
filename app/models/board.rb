class Board < ActiveRecord::Base
  has_many :sprints
  belongs_to :team
end
