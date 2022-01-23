class Setschemavalidationtonull < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :task_name, :string, :null => false
    change_column :tasks, :description, :text, :null => false
  end
end
