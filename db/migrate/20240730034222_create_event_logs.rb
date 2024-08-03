class CreateEventLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :event_logs do |t|
      t.references :save_file, null: false
      t.string :message, null: false

      t.datetime :created_at, null: false
    end
  end
end
