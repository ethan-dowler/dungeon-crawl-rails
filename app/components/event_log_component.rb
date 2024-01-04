class EventLogComponent < ApplicationComponent
  attr_reader :event_log

  delegate :message, to: :event_log

  def initialize(event_log)
    @event_log = event_log
  end

  # create custom time format for logs: https://thoughtbot.com/blog/custom-formats-for-datetime
  # display user local time: https://stackoverflow.com/questions/32451112/rails-handling-user-specific-timezone
  def timestamp = event_log.created_at.to_fs(:short)
end
