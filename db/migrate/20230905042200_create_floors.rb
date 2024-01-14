class CreateFloors < ActiveRecord::Migration[7.0]
  def change
    create_table :floors do |t|
      t.references :dungeon, null: false
      t.references :floor_template, null: false
    end
  end
end
