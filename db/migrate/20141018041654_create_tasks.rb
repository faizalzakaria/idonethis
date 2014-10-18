class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.text :details

      t.timestamps
    end
  end
end
