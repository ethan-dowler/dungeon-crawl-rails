class DungeonRunsController < ApplicationController
  before_action :ensure_required_params, only: :create
  before_action :ensure_no_run_in_progress, only: :create

  helper_method :character, :dungeon, :dungeon_run

  def create
    dungeon_template = DungeonTemplate.find(params[:dungeon_template_id])
    new_dungeon = dungeon_template.generate_new_dungeon
    dungeon_run =
      DungeonRun.create!(
        character_id: params[:character_id],
        dungeon_id: new_dungeon.id
      )

    redirect_to dungeon_run_path(dungeon_run)
  end

  def go
    new_room = dungeon_run.current_room.send(:"#{params[:direction]}_room")
    raise "Invalid direction: #{params[:direction]}" if new_room.nil?

    dungeon_run.update!(current_room: new_room)
    redirect_to dungeon_run_path(dungeon_run)
  end

  def end
    dungeon_run.end_run
    redirect_to(
      character_path(dungeon_run.character),
      notice: "You completed the #{dungeon_run.dungeon.name} dungeon!"
    )
  end

  private

  def ensure_required_params
    if params[:character_id].blank?
      redirect_back alert: 'Please choose a character for this run.', fallback_location: root_path
    elsif params[:dungeon_template_id].blank?
      redirect_back alert: 'Please choose a dungeon template for this run.', fallback_location: root_path
    end
  end

  def ensure_no_run_in_progress
    return if DungeonRun.where(character_id: params[:character_id]).active.none?

    redirect_back alert: 'Dungeon run already in progress.', fallback_location: root_path
  end

  def dungeon_run
    @dungeon_run ||= DungeonRun.find(params[:id])
  end
end
