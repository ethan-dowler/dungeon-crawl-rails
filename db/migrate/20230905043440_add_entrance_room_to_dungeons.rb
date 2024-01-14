class AddEntranceRoomToDungeons < ActiveRecord::Migration[7.0]
  def change
    add_reference :dungeon_templates, :entrance_room_template, foreign_key: { to_table: :room_templates }
    add_reference :dungeons, :entrance_room, foreign_key: { to_table: :rooms }
  end
end
