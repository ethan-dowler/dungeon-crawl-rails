class CreateEventMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :event_messages do |t|
      t.references :dungeon_run, null: false
      t.string :message, null: false

      t.datetime :created_at, null: false
    end
  end
end
