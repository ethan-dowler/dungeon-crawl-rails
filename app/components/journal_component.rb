class JournalComponent < ViewComponent::Base
  attr_reader :event_logs

  def initialize(event_logs)
    @event_logs = event_logs
  end
end
