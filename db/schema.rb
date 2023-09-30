# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_30_041743) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.integer "level", default: 0, null: false
    t.integer "xp", default: 0, null: false
    t.integer "current_hp", default: 0, null: false
    t.integer "base_hp", default: 0, null: false
    t.integer "base_attack", default: 0, null: false
    t.integer "base_defense", default: 0, null: false
  end

  create_table "conditions", force: :cascade do |t|
    t.string "source_type", null: false
    t.bigint "source_id", null: false
    t.string "target_type", null: false
    t.bigint "target_id", null: false
    t.string "condition_type", null: false
    t.index ["condition_type"], name: "index_conditions_on_condition_type"
    t.index ["source_type", "source_id"], name: "index_conditions_on_source"
    t.index ["target_type", "target_id"], name: "index_conditions_on_target"
  end

  create_table "dungeon_runs", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "dungeon_id", null: false
    t.bigint "current_room_id", null: false
    t.datetime "started_at", null: false
    t.datetime "completed_at"
    t.string "completed_reason"
    t.index ["character_id"], name: "index_dungeon_runs_on_character_id"
    t.index ["current_room_id"], name: "index_dungeon_runs_on_current_room_id"
    t.index ["dungeon_id"], name: "index_dungeon_runs_on_dungeon_id"
  end

  create_table "dungeon_templates", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
  end

  create_table "dungeons", force: :cascade do |t|
    t.bigint "dungeon_template_id", null: false
    t.index ["dungeon_template_id"], name: "index_dungeons_on_dungeon_template_id"
  end

  create_table "floors", force: :cascade do |t|
    t.bigint "dungeon_id", null: false
    t.string "name", null: false
    t.integer "level", null: false
    t.index ["dungeon_id"], name: "index_floors_on_dungeon_id"
  end

  create_table "inventory_items", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "item_id", null: false
    t.boolean "equipped", default: false, null: false
    t.index ["character_id"], name: "index_inventory_items_on_character_id"
    t.index ["item_id"], name: "index_inventory_items_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.string "equipment_slot"
    t.index ["equipment_slot"], name: "index_items_on_equipment_slot"
    t.index ["name"], name: "index_items_on_name"
  end

  create_table "modifiers", force: :cascade do |t|
    t.string "source_type", null: false
    t.bigint "source_id", null: false
    t.string "target_type", null: false
    t.bigint "target_id", null: false
    t.string "modifier_type", null: false
    t.string "stat", null: false
    t.integer "value", null: false
    t.index ["modifier_type"], name: "index_modifiers_on_modifier_type"
    t.index ["source_type", "source_id"], name: "index_modifiers_on_source"
    t.index ["stat"], name: "index_modifiers_on_stat"
    t.index ["target_type", "target_id"], name: "index_modifiers_on_target"
  end

  create_table "monster_templates", force: :cascade do |t|
    t.string "name", null: false
    t.integer "base_hp", default: 0, null: false
    t.integer "base_attack", default: 0, null: false
    t.integer "base_defense", default: 0, null: false
  end

  create_table "monsters", force: :cascade do |t|
    t.bigint "monster_template_id", null: false
    t.integer "level", default: 0, null: false
    t.integer "current_hp", default: 0, null: false
    t.bigint "current_room_id", null: false
    t.index ["current_room_id"], name: "index_monsters_on_current_room_id"
    t.index ["monster_template_id"], name: "index_monsters_on_monster_template_id"
  end

  create_table "room_items", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.bigint "item_id", null: false
    t.index ["item_id"], name: "index_room_items_on_item_id"
    t.index ["room_id"], name: "index_room_items_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "floor_id", null: false
    t.string "name", null: false
    t.boolean "entrance", default: false, null: false
    t.boolean "exit", default: false, null: false
    t.bigint "north_room_id"
    t.bigint "east_room_id"
    t.bigint "south_room_id"
    t.bigint "west_room_id"
    t.index ["east_room_id"], name: "index_rooms_on_east_room_id"
    t.index ["floor_id"], name: "index_rooms_on_floor_id"
    t.index ["north_room_id"], name: "index_rooms_on_north_room_id"
    t.index ["south_room_id"], name: "index_rooms_on_south_room_id"
    t.index ["west_room_id"], name: "index_rooms_on_west_room_id"
  end

  add_foreign_key "dungeon_runs", "rooms", column: "current_room_id"
  add_foreign_key "monsters", "rooms", column: "current_room_id"
  add_foreign_key "rooms", "rooms", column: "east_room_id"
  add_foreign_key "rooms", "rooms", column: "north_room_id"
  add_foreign_key "rooms", "rooms", column: "south_room_id"
  add_foreign_key "rooms", "rooms", column: "west_room_id"
end
