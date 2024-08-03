class CreateNonPlayerCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :non_player_characters do |t|
      t.references :save_file, null: false
      t.references :npc_template, null: false
      t.references :location

      # combat ratings
      t.integer :max_hp, null: false, default: 10
      t.integer :damage_rating, null: false, default: 0
      t.integer :armor_rating, null: false, default: 0
      t.integer :speed_rating, null: false, default: 10

      # trackables
      t.integer :current_hp, null: false, default: 10
    end
  end
end
