class MonstersController < ApplicationController
  helper_method :dungeon_run, :monster

  # TODO: put this controller action somewhere else. Like an "actions" controller or something that's used for any player action. Or maybe make a controller for each attack type? Might be too much? Maybe the action the user is taking can be a param?
  def attack
    # TODO: expose the entire previous character, so I can animate all the things
    @previous_hp = dungeon_run.character.current_hp
    DungeonRun.transaction do
      # TODO: measure speed/initiative to see who goes first
      BasicAttack.new(attacker: dungeon_run.character, defender: monster).execute
      BasicAttack.new(attacker: monster, defender: dungeon_run.character).execute

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
