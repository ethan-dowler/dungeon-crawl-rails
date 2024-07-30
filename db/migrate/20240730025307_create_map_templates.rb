class CreateMapTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :map_templates do |t|
      t.string :name, null: false
      t.string :description, null: false

      # player start position when entering this map
      t.integer :start_x, null: false, default: 0
      t.integer :start_y, null: false, default: 0
      t.integer :start_z, null: false, default: 0
    end
  end
end
