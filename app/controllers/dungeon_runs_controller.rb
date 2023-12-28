class DungeonRunsController < ApplicationController
  before_action :ensure_required_params, only: :create
  before_action :ensure_no_run_in_progress, only: :create

  helper_method :character, :dungeon, :dungeon_run

  def show; end

  def ended; end

  def create
    dungeon_template = DungeonTemplate.find(params[:dungeon_template_id])
    new_dungeon = GenerateDungeon.new(dungeon_template).execute
    dungeon_run =
      DungeonRun.create!(
        character_id: params[:character_id],
        dungeon_id: new_dungeon.id
      )

    # TODO: require character to heal outside of the dungeon, for example:
    # - resting at an inn
    # - using items
    # - paying a healer
    dungeon_run.character.refresh

    redirect_to dungeon_run_path(dungeon_run)
  end

  def go
    new_room = dungeon_run.current_room.send(:"#{params[:direction]}_room")
    raise "Invalid direction: #{params[:direction]}" if new_room.nil?

    dungeon_run.update!(current_room: new_room)
    redirect_to dungeon_run_path(dungeon_run)
  end

  def end
    EndRun.new(dungeon_run:).execute

    redirect_to ended_dungeon_run_path(dungeon_run)
  end

  private

  def dungeon_run
    @dungeon_run ||= DungeonRun.find(params[:id])
  end

  def ensure_required_params
    if params[:character_id].blank?
      redirect_back alert: "Please choose a character for this run.", fallback_location: characters_path
    elsif params[:dungeon_template_id].blank?
      redirect_back alert: "Please choose a dungeon template for this run.", fallback_location: characters_path
    end
  end

  def ensure_no_run_in_progress
    return if DungeonRun.where(character_id: params[:character_id]).active.none?

    redirect_back alert: "Dungeon run already in progress.", fallback_location: characters_path
  end
end
