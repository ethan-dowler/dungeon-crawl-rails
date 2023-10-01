class CreateItemDrops < ActiveRecord::Migration[7.0]
  def change
    create_table :item_drops do |t|
      t.references :monster_template, null: false
      t.references :item, null: false
      t.integer :odds, null: false
    end
  end
end
