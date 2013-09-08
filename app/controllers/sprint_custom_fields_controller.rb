class SprintCustomFieldsController < ApplicationController
  unloadable
  respond_to :json

  before_filter :find_project_by_project_id, :authorize

  def update
    custom_field = CustomTaskField.find(params[:id])
    if custom_field.update_attributes(params.slice(:value))
      render json: custom_field.value, status: :ok
    else
      render json: custom_field.errors, status: :unprocessable_entity
    end
  end

  def update_by_type
    task = SprintsTasks.find(params[:id])
    type = CustomTaskFieldType.find(params[:type_id])
    custom_field = CustomTaskField.find_or_create_by_task_and_type(task, type)
    if custom_field.update_attributes(params.slice(:value))
      render json: custom_field.value, status: :ok
    else
      render json: custom_field.errors, status: :unprocessable_entity
    end
  end
end
