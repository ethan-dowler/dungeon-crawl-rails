class EndRun
  attr_reader :dungeon_run, :completed_reason

  def initialize(dungeon_run:, completed_reason: DungeonRun::CompletedReason::ELECTIVE)
    @dungeon_run = dungeon_run
    @completed_reason = completed_reason
  end

  def execute
    DungeonRun.transaction do
      dungeon_run.update!(
        completed_at: DateTime.current,
        completed_reason:
      )
      dungeon_run.character.refresh
      # TODO: other post-run activies
    end
  end
end
