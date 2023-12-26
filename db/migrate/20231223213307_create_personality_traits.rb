class CreatePersonalityTraits < ActiveRecord::Migration[7.0]
  def change
    create_table :personality_traits do |t|
      t.references :owner, polymorphic: true, null: false
      t.references :trait, null: false
    end
  end
end
