class CreateModifiers < ActiveRecord::Migration[7.0]
  def change
    create_table :modifiers do |t|
      t.references :source, polymorphic: true, null: false
      t.references :target, polymorphic: true, null: false
      t.string :modifier_type, null: false, index: true
      t.string :stat, null: false, index: true
      t.integer :value, null: false
    end
  end
end
