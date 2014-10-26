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
end
