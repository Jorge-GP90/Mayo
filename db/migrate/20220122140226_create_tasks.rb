class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :task_name 
      t.text :description
      t.string :priority
      t.string :status
      t.datetime :deadline

      t.timestamps
    end
  end
end
