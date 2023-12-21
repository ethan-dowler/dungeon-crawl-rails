class CreateInventoryItems < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_items do |t|
      t.references :owner, null: false, polymorphic: true
      t.references :item, null: false
      t.integer :quantity, null: false, default: 1
      t.boolean :equipped, null: false, default: false
    end
  end
end
