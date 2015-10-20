class Task < ActiveRecord::Base
  resourcify
  belongs_to :user

  validates :details, presence: true

  def self.filter_last_n_day(count)
    day = Date.today - count
    Task.where("task_date >= ? AND task_date <= ?", day, day + 1)
  end

end
