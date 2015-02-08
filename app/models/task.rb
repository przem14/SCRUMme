class Task < ActiveRecord::Base
  belongs_to :sprint
  belongs_to :user

  validates :title, presence: true
  validates :estimate, presence: true

  def percent_done
    ((estimate.to_f - remaining_time.to_f) / estimate.to_f) * 100.0
  end
end
