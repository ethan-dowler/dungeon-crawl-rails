class CreateItemTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :item_templates do |t|
      t.string :name, null: false, index: true
      t.string :description
      t.integer :value, null: false, default: 0
      t.boolean :stackable, null: false, default: false
      t.string :equipment_slot, index: true

      # base stats for equipment; item instances can be changed
      t.integer :base_armor_rating, null: false, default: 0
      t.integer :base_damage_rating, null: false, default: 0
    end
  end
end
