class CreateDungeons < ActiveRecord::Migration[7.0]
  def change
    create_table :dungeons do |t|
      t.references :dungeon_template, null: false
    end
  end
end
