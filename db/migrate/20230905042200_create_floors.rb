class CreateFloors < ActiveRecord::Migration[7.0]
  def change
    create_table :floors do |t|
      t.references :dungeon, null: false
      t.string :name, null: false
      t.integer :level, null: false
    end
  end
end
