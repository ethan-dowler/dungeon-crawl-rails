class CreateTileTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :tile_templates do |t|
      t.references :map_template, null: false
      t.string :name
      t.string :description

      t.integer :x, null: false
      t.integer :y, null: false
      t.integer :z, null: false
    end
  end
end
