class RemoveUtcOffsetFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :utc_offset
  end
end
