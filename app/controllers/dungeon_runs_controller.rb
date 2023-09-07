class DungeonRunsController < ApplicationController
  before_action :ensure_required_params, only: :create
  before_action :ensure_no_run_in_progress, only: :create

  helper_method :character, :dungeon, :dungeon_run

  def create
    dungeon_run =
      DungeonRun.create!(
        character_id: params[:character_id],
        dungeon_id: params[:dungeon_id]
      )

    redirect_to(
      dungeon_run_path(dungeon_run),
      notice: "You entered the <b>#{dungeon_run.dungeon.name}</b> dungeon!"
    )
  end

private

  def ensure_required_params
    if params[:character_id].blank?
      redirect_back alert: "Please choose a character for this run."
    elsif params[:dungeon_id].blank?
      redirect_back alert: "Please choose a dungeon for this run."
    end
  end

  def ensure_no_run_in_progress
    return if DungeonRun.where(character_id: params[:character_id]).active.none?

    redirect_back alert: "Dungeon run already in progress."
  end

  def dungeon_run
    @dungeon_run ||= DungeonRun.find(params[:id])
  end
end
