class CreateCustomTaskFields < ActiveRecord::Migration
  def change
    create_table :custom_task_fields do |t|
      t.integer :value
      t.references :type
      t.references :sprints_tasks
    end
    add_index :custom_task_fields, :type_id
    add_index :custom_task_fields, :sprints_tasks_id
    add_index :custom_task_fields, [:type_id, :sprints_tasks_id]
  end
end
