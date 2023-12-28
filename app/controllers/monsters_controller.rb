class MonstersController < ApplicationController
  helper_method :dungeon_run, :monster

  # TODO: put this controller action somewhere else.
  # Like an "actions" controller or something that's used for any player action.
  # Or maybe make a controller for each attack type? Might be too much?
  # Maybe the action the user is taking can be a param?
  def attack # rubocop:disable Metrics/AbcSize
    @previous_character = dungeon_run.character.dup
    DungeonRun.transaction do
      # player and monster act in speed order
      combatants = [dungeon_run.character, monster].sort! { |a, b| b.speed - a.speed }
      BasicAttack.new(attacker: combatants.first, defender: combatants.second).execute
      BasicAttack.new(attacker: combatants.second, defender: combatants.first).execute

      ResolveCombat.new(character: dungeon_run.character, monster:).execute
    end

    redirect_to ended_dungeon_run_path(dungeon_run) if dungeon_run.reload.ended?
  end

  private

  def dungeon_run
    @dungeon_run ||= DungeonRun.find(params[:dungeon_run_id])
  end

  def monster
    @monster ||= Monster.find(params[:id])
  end
end
