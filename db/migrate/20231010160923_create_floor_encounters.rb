class CreateFloorEncounters < ActiveRecord::Migration[7.0]
  def change
    create_table :floor_encounters do |t|
      t.references :floor, null: false
      t.references :monster_template, null: false
      t.integer :percent_chance, null: false, default: 0
      t.integer :level_range_start, null: false, default: 1
      t.integer :level_range_end, null: false, default: 1
    end
  end
end
