class CreateFloorTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :floor_templates do |t|
      t.references :dungeon_template, null: false
      t.string :name, null: false
      t.integer :level, null: false
    end
  end
end
