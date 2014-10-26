# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  details    :text
#  created_at :datetime
#  updated_at :datetime
#

class Task < ActiveRecord::Base
  belongs_to :user

  def self.filter_last_n_day(count)
    day = Date.today - count
    Task.where("created_at >= ? AND created_at <= ?", day, day + 1)
  end
end
