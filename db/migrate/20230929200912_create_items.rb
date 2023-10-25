class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.string :description, null: false
      t.integer :value, null: false, default: 0
      t.string :equipment_slot, index: true
    end
  end
end
