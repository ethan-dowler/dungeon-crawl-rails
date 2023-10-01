class MonstersController < ApplicationController
  def attack
    damage_dealt = 0
    DungeonRun.transaction do
      # TODO: measure speed/initiative to see who goes first
      damage_dealt = BasicAttack.new(attacker: character, defender: monster).execute
      BasicAttack.new(attacker: monster, defender: character).execute
      ResolveCombat.new(character:, monster:)
    end

    redirect_to(
      dungeon_run_path(dungeon_run),
      damage: "You dealt #{damage_dealt} damage to the #{monster.name}!"
    )
  end

private

  def dungeon_run
    @dungeon_run ||= DungeonRun.find(params[:dungeon_run_id])
  end

  def character
    @character ||= dungeon_run.character
  end

  def monster
    @monster ||= Monster.find(params[:id])
  end
end
