class CustomTaskFieldType < ActiveRecord::Base
  unloadable

  attr_accessible :name

  has_many :custom_task_fields, dependent: :destroy, foreign_key: :type_id

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end
end
