class CustomTaskField < ActiveRecord::Base
  unloadable

  belongs_to :sprints_tasks
  belongs_to :custom_task_field_type
end
