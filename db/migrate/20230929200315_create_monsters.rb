class CreateMonsters < ActiveRecord::Migration[7.0]
  def change
    create_table :monsters do |t|
      t.references :monster_template, null: false
      t.integer :level, null: false, default: 0
      t.integer :current_hp, null: false, default: 0
      t.references :current_room, foreign_key: { to_table: :rooms }, null: false
    end
  end
end
