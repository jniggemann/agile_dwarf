class CustomTaskField < ActiveRecord::Base
  unloadable

  belongs_to :sprints_tasks
  belongs_to :type, class_name: 'CustomTaskFieldType'

  attr_accessible :value

  validates_presence_of :type_id

  def self.find_or_create_by_task_and_type(task, type)
    result = where("sprints_tasks_id = ? AND type_id = ?", task.id, type.id).first
    if result
      result
    else
      self.create do |ct|
        ct.sprints_tasks_id = task.id
        ct.type_id = type.id
      end
    end
  end
end
