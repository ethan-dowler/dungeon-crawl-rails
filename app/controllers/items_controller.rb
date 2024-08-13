class ItemsController < ApplicationController
  helper_method :character, :item

  def index; end

  # def loot
  #   LootItem.new(item:, character: dungeon_run.character).execute
  # end

  def toggle
    if item.equipped?
      UnequipItem.new(item).execute
    else
      EquipItem.new(item).execute
    end
  end

  private

  def player_character
    @player_character ||= PlayerCharacter.find(params[:player_character_id])
  end

  def item
    @item ||= Item.find(params[:id])
  end
end
