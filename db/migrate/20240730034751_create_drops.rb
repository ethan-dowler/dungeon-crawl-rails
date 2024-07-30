class CreateDrops < ActiveRecord::Migration[7.0]
  def change
    create_table :drops do |t|
      t.references :npc_template, null: false
      t.references :item_template, null: false
      t.integer :percent_chance, null: false, default: 100
      t.integer :quantity, null: false, default: 1
    end
  end
end
