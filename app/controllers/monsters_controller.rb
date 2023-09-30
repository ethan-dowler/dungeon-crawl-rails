class MonstersController < ApplicationController
  def attack
    damage_dealt = 0
    DungeonRun.transaction do
      # the character and monster attack each other
      # TODO: measure speed/initiative to see who goes first
      damage_dealt = BasicAttack.new(attacker: dungeon_run.character, defender: monster).execute
      BasicAttack.new(attacker: monster, defender: dungeon_run.character).execute unless monster.defeated?
    end

    message =
      if monster.defeated?
        "You defeated the #{monster.name}!"
      else
        "You dealt #{damage_dealt} damage to the #{monster.name}!"
      end

    redirect_to(
      dungeon_run_path(dungeon_run),
      damage: message
    )
  end

  def loot
    # TODO: Treasure~ (and maybe XP?)
  end

private

  def monster
    @monster ||= Monster.find(params[:id])
  end

  def dungeon_run
    @dungeon_run ||= DungeonRun.find(params[:dungeon_run_id])
  end
end
