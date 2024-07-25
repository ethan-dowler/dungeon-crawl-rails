class EndRun
  attr_reader :dungeon_run, :ended_reason

  def initialize(dungeon_run:, ended_reason: DungeonRun::EndedReason::ELECTIVE)
    @dungeon_run = dungeon_run
    @ended_reason = ended_reason
  end

  def execute
    DungeonRun.transaction do
      dungeon_run.update!(
        completed_at: DateTime.current,
        ended_reason:
      )
    end
  end
end
