class MigrateOldTaskToTaskDate < ActiveRecord::Migration
  def up
    Task.find_each do |task|
      task.update_attributes(task_date: task.created_at)
    end
  end
end
