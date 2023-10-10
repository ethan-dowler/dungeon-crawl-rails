class CreateMonsterTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :monster_templates do |t|
      # high-level info
      t.string :name, null: false
      t.integer :base_experience_yield, null: false

      # base stats
      t.integer :base_hp, null: false, default: 10
      t.integer :base_attack, null: false, default: 10
      t.integer :base_defense, null: false, default: 10
      t.integer :base_speed, null: false, default: 10
    end
  end
end
