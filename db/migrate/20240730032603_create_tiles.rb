class CreateTiles < ActiveRecord::Migration[7.0]
  def change
    create_table :tiles do |t|
      t.references :map, null: false
      t.references :tile_template, null: false
    end
  end
end
