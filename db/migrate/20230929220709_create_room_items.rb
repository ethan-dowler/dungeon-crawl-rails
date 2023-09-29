class CreateRoomItems < ActiveRecord::Migration[7.0]
  def change
    create_table :room_items do |t|
      t.references :room, null: false
      t.references :item, null: false
    end
  end
end
