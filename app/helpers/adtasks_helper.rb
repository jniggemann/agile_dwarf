module AdtasksHelper
  def options_for_tracker_select
    options = Tracker.pluck(:name)
    options.unshift('All')
    options_for_select(options, @trackers)
  end
end
