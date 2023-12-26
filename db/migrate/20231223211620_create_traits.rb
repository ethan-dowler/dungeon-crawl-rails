class CreateTraits < ActiveRecord::Migration[7.0]
  def change
    create_table :traits do |t|
      t.string :name, null: false
      t.string :explanation, null: false
    end
  end
end
