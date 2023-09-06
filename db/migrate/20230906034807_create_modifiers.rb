class CreateModifiers < ActiveRecord::Migration[7.0]
  def change
    create_table :modifiers do |t|
      t.references :character, null: false
      t.string :stat, index: :true
      t.integer :value, null: false, default: 1
    end
  end
end
