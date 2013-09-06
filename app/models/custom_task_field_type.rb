class CustomTaskFieldType < ActiveRecord::Base
  unloadable

  has_many :custom_task_fields
end
