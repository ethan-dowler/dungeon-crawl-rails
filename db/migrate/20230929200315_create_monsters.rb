class CreateMonsters < ActiveRecord::Migration[7.0]
  def change
    create_table :monsters do |t|
      # attributes from template
      t.references :monster_template, null: false

      # trackables
      t.integer :current_hp, null: false, default: 0
      t.integer :level, null: false, default: 0
      t.references :current_room, foreign_key: { to_table: :rooms }
    end
  end
end
