class ChangeColumnDefaultUserIdOnTasks < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tasks, :user_id, :default => nil
  end
end
