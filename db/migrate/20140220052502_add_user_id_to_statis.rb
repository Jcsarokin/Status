class AddUserIdToStatis < ActiveRecord::Migration
  def change
    add_column :statis, :user_id, :integer
    add_index :statis, :user_id
  end
end
