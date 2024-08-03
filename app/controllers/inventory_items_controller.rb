class InventoryItemsController < ApplicationController
  helper_method :inventory_item, :dungeon_run, :character

  def index; end

  def loot
    LootItem.new(inventory_item:, character: dungeon_run.character).execute
  end

  def toggle
    if inventory_item.equipped?
      UnequipItem.new(inventory_item).execute
    else
      EquipItem.new(inventory_item).execute
    end
  end

  private

  def character
    @character ||= Character.find(params[:character_id])
  end

  def inventory_item
    @inventory_item ||= InventoryItem.find(params[:id])
  end

  def dungeon_run
    @dungeon_run ||= DungeonRun.find(params[:dungeon_run_id])
  end
end
