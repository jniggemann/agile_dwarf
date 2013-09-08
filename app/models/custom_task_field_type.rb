class CustomTaskFieldType < ActiveRecord::Base
  unloadable

  has_many :custom_task_fields
  validates :name, presence: true, uniqueness: true
end
