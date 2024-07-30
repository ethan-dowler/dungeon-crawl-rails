class CreateSaveFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :save_files do |t|
      t.string :name, null: false
      t.references :location, foreign_key: { to_table: :tiles }
    end
  end
end
