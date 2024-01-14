class CreateRoomTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :room_templates do |t|
      t.references :floor_template, null: false
      t.string :name, null: false

      t.references :north_room_template, foreign_key: { to_table: :room_templates }
      t.references :east_room_template, foreign_key: { to_table: :room_templates }
      t.references :south_room_template, foreign_key: { to_table: :room_templates }
      t.references :west_room_template, foreign_key: { to_table: :room_templates }

      t.references :above_room_template, foreign_key: { to_table: :room_templates }
      t.references :below_room_template, foreign_key: { to_table: :room_templates }
    end
  end
end
