class ChangeDeadlineToNull < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :deadline, :datetime, null: false, default: -> { "now()" }
  end
end
