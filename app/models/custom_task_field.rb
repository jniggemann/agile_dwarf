class CustomTaskField < ActiveRecord::Base
  unloadable

  belongs_to :sprints_tasks
  belongs_to :custom_task_field_type

  validates_presence_of :custom_task_field_type_id, :sprints_tasks_id
end
