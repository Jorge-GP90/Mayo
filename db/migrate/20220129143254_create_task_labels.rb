class CreateTaskLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :task_labels do |t|
      t.references :task, foreign_key: true, task_id: false
      t.references :label, foreign_key: true, label_id: false

      t.timestamps
    end
  end
end
