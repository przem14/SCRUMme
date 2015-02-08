class Sprint < ActiveRecord::Base
  belongs_to :board
  has_many :tasks

  def remaining_time
    sum = 0

    tasks.each { |task| sum += task.remaining_time }
    sum
  end

  def estimate
    sum = 0

    tasks.each { |task| sum += task.estimate }
    sum
  end

  def percent_done
    tasks.empty? ? 100 : ((estimate.to_f - remaining_time.to_f) / estimate.to_f) * 100.0
  end
end
