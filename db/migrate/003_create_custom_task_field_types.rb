class CreateCustomTaskFieldTypes < ActiveRecord::Migration
  def change
    create_table :custom_task_field_types do |t|
      t.string :name
    end
  end
end
