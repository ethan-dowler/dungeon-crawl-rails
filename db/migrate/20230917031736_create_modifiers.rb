class CreateModifiers < ActiveRecord::Migration[7.0]
  def change
    create_table :modifiers do |t|
      t.references :source, polymorphic: true, null: false
      t.string :modifier_type, null: false
      t.string :stat, null: false
      t.integer :value, null: false, default: 1
    end

    # easily query for all modifiers with a specific source, type, and stat
    add_index :modifiers, %i[source_id source_type modifier_type stat], name: :index_modifiers_combo
  end
end
