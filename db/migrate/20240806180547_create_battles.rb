class CreateBattles < ActiveRecord::Migration[7.0]
  def change
    create_table :battles do |t|
      t.references :save_file, null: false
      t.integer :initiative, null: false, default: 0
    end
  end
end
