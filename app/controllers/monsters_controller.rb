class MonstersController < ApplicationController
  helper_method :dungeon_run, :monster

  def attack
    DungeonRun.transaction do
      # TODO: measure speed/initiative to see who goes first
      # OR:   make combat more back-and-forth, not instantaneous.
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
