require 'redmine'

require 'scrum_enabled_module_patch'

# This plugin should be reloaded in development mode.
if (Rails.env == "development")
  ActiveSupport::Dependencies.autoload_once_paths.reject!{|x| x =~ /^#{Regexp.escape(File.dirname(__FILE__))}/}
end

Redmine::Plugin.register :agile_dwarf do
  name 'Agile dwarf plugin'
  author 'Mark Ablovacky'
  description 'Agile for Redmine'
  version '0.0.3'
  url ''

  settings :default => {
      :tracker => 1,
      :activity => 1,
      :stclosed => 1,
      :stcolumn1 => 1,
      :stcolumn2 => 2,
      :stcolumn3 => 3,
      :stcolumn4 => 1,
      :stcolumn5 => 2,
  }, :partial => 'shared/settings'

  permission :all_sprints, { :all_sprints => [:index]}
  menu :application_menu, :all_sprints, { :controller => 'all_sprints', :action => 'index' }, :caption => :label_menu_all_sprints

  project_module :agiledwarf do
    permission :sprints, {:adsprints => [:list], :adtaskinl => [:update, :inplace, :create, :tooltip], :adsprintinl => [:create, :inplace]}
    permission :sprints_readonly, {:adsprints => [:list]}
    permission :sprints_tasks, {:adtasks => [:list], :adtaskinl => [:update, :inplace, :tooltip, :spent]}
    permission :sprints_tasks_readonly, {:adtasks => [:list]}
    permission :burndown_charts, {:adburndown => [:show]}
    permission :update_custom_fields, {sprint_custom_fields: [:update, :update_by_type]}
  end

  menu :project_menu, :adtasks, { :controller => 'adtasks', :action => 'list' }, :caption => :label_menu_mytasks, :after => :activity, :param => :project_id
  menu :project_menu, :adsprints, { :controller => 'adsprints', :action => 'list' }, :caption => :label_menu_sprints, :after => :adtasks, :param => :project_id
  menu :project_menu, :adburndown, { :controller => 'adburndown', :action => 'show' }, :caption => :label_menu_burndown, :after => :adsprints, :param => :project_id
end
