class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.string :description
      t.integer :value, null: false, default: 0
      t.boolean :stackable, null: false, default: false
      t.string :equipment_slot, index: true

      # calculated stats; cached for performance
      t.integer :armor_rating, null: false, default: 0
      t.integer :damage_rating, null: false, default: 0
    end
  end
end
