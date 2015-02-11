class Board < ActiveRecord::Base
  has_many :sprints, dependent: :destroy
  belongs_to :team
end
