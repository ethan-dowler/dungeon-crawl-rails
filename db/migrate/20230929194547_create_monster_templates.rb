class CreateMonsterTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :monster_templates do |t|
      # high-level info
      t.string :name, null: false

      # base stats
      t.integer :base_hp, null: false, default: 0
      t.integer :base_attack, null: false, default: 0
      t.integer :base_defense, null: false, default: 0
    end
  end
end
