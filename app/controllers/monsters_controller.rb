class MonstersController < ApplicationController
  def attack

  end

private

  def monster
    @monster ||= Monster.find(params[:id])
  end

  def character
    monster.dungeon_run.character
  end
end
