class CreatePlayerCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :player_characters do |t|
      t.references :save_file, null: false

      # personal info
      t.string :name, null: false

      # attributes
      t.integer :body, null: false, default: 1
      t.integer :mind, null: false, default: 1
      t.integer :spirit, null: false, default: 1

      # trackables
      t.integer :current_hp, null: false, default: 10
      t.integer :level, null: false, default: 1
      t.integer :xp, null: false, default: 0
      t.integer :bonus_skill_points, null: false, default: 0
      # TODO: track active party members vs inactive roster members

      # calculated stats; cached for performance
      t.integer :max_hp, null: false, default: 10
      t.integer :damage_rating, null: false, default: 0
      t.integer :armor_rating, null: false, default: 0
      t.integer :speed_rating, null: false, default: 0
    end
  end
end
