class CustomTaskFieldType < ActiveRecord::Base
  unloadable

  has_many :custom_task_fields, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
