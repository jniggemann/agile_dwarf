class CustomFieldTypesController < ApplicationController
  unloadable
  respond_to :json

  skip_before_filter :verify_authenticity_token
  before_filter :require_admin

  def create
    type = CustomTaskFieldType.new(params[:custom_task_field_type])

    if type.save
      render json: {id: type.id}, status: :ok
    else
      render json: type.errors, status: :unprocessable_entity
    end
  end

  def destroy
    type = CustomTaskFieldType.find(params[:id])

    type.destroy || raise(ActiveRecord::RecordNotDestroyed)
    render json: {}, status: :ok
  end
end
