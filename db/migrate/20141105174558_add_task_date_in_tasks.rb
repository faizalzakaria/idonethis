class AddTaskDateInTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :task_date, :datetime
  end
end
