class PickupRoomItem
  attr_reader :character, :room_item

  def initialize(character:, room_item:)
    @character = character
    @room_item = room_item
  end

  def execute
    Character.transaction do
      add_to_inventory
      remove_from_room
    end
  end

  private

  def add_to_inventory
    # TODO
  end

  def remove_from_room
    # TODO
  end
end
