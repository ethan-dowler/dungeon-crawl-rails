class CreateDungeonTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :dungeon_templates do |t|
      t.string :name, null: false
      t.string :description, null: false
    end
  end
end
