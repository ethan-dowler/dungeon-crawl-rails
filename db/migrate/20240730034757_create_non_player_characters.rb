class CreateNonPlayerCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :non_player_characters do |t|
      t.references :save_file, null: false
      t.references :npc_template, null: false
      t.references :tile

      # trackables
      t.integer :current_hp, null: false, default: 10
    end
  end
end
