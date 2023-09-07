class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.references :dungeon, null: false
      # can the player start in this room?
      t.boolean :entrance, null: false, default: false
      # cardinal directions
      t.references :north_room, foreign_key: { to_table: :rooms }
      t.references :east_room, foreign_key: { to_table: :rooms }
      t.references :south_room, foreign_key: { to_table: :rooms }
      t.references :west_room, foreign_key: { to_table: :rooms }
      # three dimensions!
      t.references :above_room, foreign_key: { to_table: :rooms }
      t.references :below_room, foreign_key: { to_table: :rooms }
    end
  end
end
