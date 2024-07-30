class CreateEncounters < ActiveRecord::Migration[7.0]
  def change
    create_table :encounters do |t|
      t.references :tile_template, null: false
      t.references :npc_template, null: false
      t.integer :percent_chance, null: false, default: 100
    end
  end
end
