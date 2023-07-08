class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.integer :level, null: false, default: 0
      t.integer :xp, null: false, default: 0
      t.integer :max_hp, null: false, default: 0
      t.integer :current_hp, null: false, default: 0
      t.integer :attack, null: false, default: 0
      t.integer :defense, null: false, default: 0

      t.timestamps
    end
  end
end
