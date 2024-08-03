class CreateNpcTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :npc_templates do |t|
      # high-level info
      t.string :name, null: false
      t.integer :base_experience_yield, null: false, default: 0

      # combat ratings - monsters don't wear equipment!
      t.integer :level, null: false, default: 1
      t.integer :base_hp, null: false, default: 10
      t.integer :base_damage_rating, null: false, default: 0
      t.integer :base_armor_rating, null: false, default: 0
      t.integer :base_speed_rating, null: false, default: 10
    end
  end
end
