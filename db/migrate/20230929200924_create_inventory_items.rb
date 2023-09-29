class CreateInventoryItems < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_items do |t|
      t.references :character, null: false
      t.references :item, null: false
      t.boolean :equipped, null: false, default: false
    end
  end
end
