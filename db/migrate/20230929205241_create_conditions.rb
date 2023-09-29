class CreateConditions < ActiveRecord::Migration[7.0]
  def change
    create_table :conditions do |t|
      t.references :source, polymorphic: true, null: false
      t.references :target, polymorphic: true, null: false
      t.string :condition_type, null: false, index: true
    end
  end
end
