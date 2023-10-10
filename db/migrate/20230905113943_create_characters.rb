class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      # high-level info
      t.string :name, null: false
      t.integer :level, null: false, default: 0
      t.integer :xp, null: false, default: 0
      t.integer :current_hp, null: false, default: 0

      # base stats
      t.integer :base_hp, null: false, default: 10
      t.integer :base_attack, null: false, default: 10
      t.integer :base_defense, null: false, default: 10
      t.integer :base_speed, null: false, default: 10
    end
  end
end
