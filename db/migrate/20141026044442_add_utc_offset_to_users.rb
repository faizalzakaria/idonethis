class AddUtcOffsetToUsers < ActiveRecord::Migration
  def change
    add_column :users, :utc_offset, :integer
  end
end
