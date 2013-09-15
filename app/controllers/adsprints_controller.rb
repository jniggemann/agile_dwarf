class AdsprintsController < ApplicationController
  unloadable

  before_filter :find_project, :authorize

  def list
    @backlog = SprintsTasks.get_backlog(@project)
    @sprints = Sprints.all_sprints(@project).select {|s| s.name.downcase.match(/release$/).nil? }

    # releases are a versioned backlog that appear on the left side of the interface, rather than with the rest of the sprints on the right
    @releases = Sprints.all_sprints(@project).select {|s| s.name.downcase.match(/release$/).present? }

    # Need to overwrite the @tasks for each sprint to use @project, and not the project the sprint has. (ie Sprint belongs to a Super Project but @project is a sub project)
    # TODO: this is fugly and needs to be cleaner
    @sprints.each {|s| s.tasks = SprintsTasks.get_tasks_by_sprint(@project, s.id) }
    @releases.each {|s| s.tasks = SprintsTasks.get_tasks_by_sprint(@project, s.id) }

    @assignables = {}
    @project.assignable_users.each{|u| @assignables[u.id] = u.name}
    @project_id = @project.id
    @plugin_path = File.join(Redmine::Utils.relative_url_root, 'plugin_assets', 'agile_dwarf')
    @closed_status = Setting.plugin_agile_dwarf["stclosed"].to_i
    @available_custom_fields = SprintsTasks.available_custom_fields(@project)
  end

  private

  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find(params[:project_id])
  end
end
