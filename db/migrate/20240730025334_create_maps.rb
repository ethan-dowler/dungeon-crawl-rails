class CreateMaps < ActiveRecord::Migration[7.0]
  def change
    create_table :maps do |t|
      t.references :save_file, null: false
      t.references :map_template, null: false
    end
  end
end
