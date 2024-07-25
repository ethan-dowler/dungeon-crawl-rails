class CreateRoomEncounters < ActiveRecord::Migration[7.0]
  def change
    create_table :room_encounters do |t|
      t.references :room_template, null: false
      t.references :monster_template, null: false
      t.integer :percent_chance, null: false, default: 100
    end
  end
end
