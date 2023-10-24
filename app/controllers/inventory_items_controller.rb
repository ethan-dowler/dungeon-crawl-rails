class InventoryItemsController < ApplicationController
  helper_method :inventory_item, :dungeon_run

  def loot
    TransferItem.new(inventory_item:, receiver: dungeon_run.character).execute
  end

  private

  def inventory_item
    @inventory_item ||= InventoryItem.find(params[:id])
  end

  def dungeon_run
    @dungeon_run ||= DungeonRun.find(params[:dungeon_run_id])
  end
end
