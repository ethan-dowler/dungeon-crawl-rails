class CreateMonsterTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :monster_templates do |t|
      # high-level info
      t.string :name, null: false
      t.integer :base_experience_yield, null: false, default: 0

      # attributes
      t.integer :body, null: false, default: 1
      t.integer :mind, null: false, default: 1
      t.integer :spirit, null: false, default: 1

      # combat ratings - monsters don't wear equipment!
      t.integer :max_hp, null: false, default: 10
      t.integer :speed_factor, null: false, default: 10
      t.integer :armor_rating, null: false, default: 0
      t.integer :damage_rating, null: false, default: 0
    end
  end
end
