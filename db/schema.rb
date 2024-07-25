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

ActiveRecord::Schema[7.0].define(version: 2023_12_28_052738) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.integer "body", default: 1, null: false
    t.integer "mind", default: 1, null: false
    t.integer "spirit", default: 1, null: false
    t.integer "current_hp", default: 10, null: false
    t.integer "level", default: 1, null: false
    t.integer "xp", default: 0, null: false
    t.integer "bonus_skill_points", default: 0, null: false
    t.integer "max_hp", default: 10, null: false
    t.integer "speed_factor", default: 10, null: false
    t.integer "armor_rating", default: 0, null: false
    t.integer "damage_rating", default: 0, null: false
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

  create_table "drops", force: :cascade do |t|
    t.bigint "monster_template_id", null: false
    t.bigint "item_id", null: false
    t.integer "percent_chance", default: 100, null: false
    t.integer "quantity", default: 1, null: false
    t.index ["item_id"], name: "index_drops_on_item_id"
    t.index ["monster_template_id"], name: "index_drops_on_monster_template_id"
  end

  create_table "dungeon_runs", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "dungeon_id", null: false
    t.bigint "current_room_id", null: false
    t.datetime "started_at", null: false
    t.datetime "completed_at"
    t.string "ended_reason"
    t.index ["character_id"], name: "index_dungeon_runs_on_character_id"
    t.index ["current_room_id"], name: "index_dungeon_runs_on_current_room_id"
    t.index ["dungeon_id"], name: "index_dungeon_runs_on_dungeon_id"
  end

  create_table "dungeon_templates", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.bigint "entrance_room_template_id"
    t.index ["entrance_room_template_id"], name: "index_dungeon_templates_on_entrance_room_template_id"
  end

  create_table "dungeons", force: :cascade do |t|
    t.bigint "dungeon_template_id", null: false
    t.bigint "entrance_room_id"
    t.index ["dungeon_template_id"], name: "index_dungeons_on_dungeon_template_id"
    t.index ["entrance_room_id"], name: "index_dungeons_on_entrance_room_id"
  end

  create_table "event_logs", force: :cascade do |t|
    t.bigint "dungeon_run_id", null: false
    t.string "message", null: false
    t.datetime "created_at", null: false
    t.index ["dungeon_run_id"], name: "index_event_logs_on_dungeon_run_id"
  end

  create_table "floor_templates", force: :cascade do |t|
    t.bigint "dungeon_template_id", null: false
    t.string "name", null: false
    t.integer "level", null: false
    t.index ["dungeon_template_id"], name: "index_floor_templates_on_dungeon_template_id"
  end

  create_table "floors", force: :cascade do |t|
    t.bigint "dungeon_id", null: false
    t.bigint "floor_template_id", null: false
    t.index ["dungeon_id"], name: "index_floors_on_dungeon_id"
    t.index ["floor_template_id"], name: "index_floors_on_floor_template_id"
  end

  create_table "inventory_items", force: :cascade do |t|
    t.string "owner_type", null: false
    t.bigint "owner_id", null: false
    t.bigint "item_id", null: false
    t.integer "quantity", default: 1, null: false
    t.boolean "equipped", default: false, null: false
    t.index ["item_id"], name: "index_inventory_items_on_item_id"
    t.index ["owner_type", "owner_id"], name: "index_inventory_items_on_owner"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.integer "value", default: 0, null: false
    t.boolean "stackable", default: false, null: false
    t.string "equipment_slot"
    t.integer "armor_rating", default: 0, null: false
    t.integer "damage_rating", default: 0, null: false
    t.index ["equipment_slot"], name: "index_items_on_equipment_slot"
    t.index ["name"], name: "index_items_on_name"
  end

  create_table "modifiers", force: :cascade do |t|
    t.string "source_type", null: false
    t.bigint "source_id", null: false
    t.string "target_type", null: false
    t.bigint "target_id", null: false
    t.string "stat", null: false
    t.string "modifier_type", null: false
    t.integer "value", null: false
    t.index ["modifier_type"], name: "index_modifiers_on_modifier_type"
    t.index ["source_type", "source_id"], name: "index_modifiers_on_source"
    t.index ["stat"], name: "index_modifiers_on_stat"
    t.index ["target_type", "target_id"], name: "index_modifiers_on_target"
  end

  create_table "monster_templates", force: :cascade do |t|
    t.string "name", null: false
    t.integer "base_experience_yield", default: 0, null: false
    t.integer "body", default: 1, null: false
    t.integer "mind", default: 1, null: false
    t.integer "spirit", default: 1, null: false
    t.integer "level", default: 1, null: false
    t.integer "max_hp", default: 10, null: false
    t.integer "speed_factor", default: 10, null: false
    t.integer "armor_rating", default: 0, null: false
    t.integer "damage_rating", default: 0, null: false
  end

  create_table "monsters", force: :cascade do |t|
    t.bigint "monster_template_id", null: false
    t.integer "current_hp", default: 0, null: false
    t.bigint "current_room_id"
    t.index ["current_room_id"], name: "index_monsters_on_current_room_id"
    t.index ["monster_template_id"], name: "index_monsters_on_monster_template_id"
  end

  create_table "personality_traits", force: :cascade do |t|
    t.string "owner_type", null: false
    t.bigint "owner_id", null: false
    t.bigint "trait_id", null: false
    t.index ["owner_type", "owner_id"], name: "index_personality_traits_on_owner"
    t.index ["trait_id"], name: "index_personality_traits_on_trait_id"
  end

  create_table "room_encounters", force: :cascade do |t|
    t.bigint "room_template_id", null: false
    t.bigint "monster_template_id", null: false
    t.integer "percent_chance", default: 100, null: false
    t.index ["monster_template_id"], name: "index_room_encounters_on_monster_template_id"
    t.index ["room_template_id"], name: "index_room_encounters_on_room_template_id"
  end

  create_table "room_templates", force: :cascade do |t|
    t.bigint "floor_template_id", null: false
    t.string "name", null: false
    t.bigint "north_room_template_id"
    t.bigint "east_room_template_id"
    t.bigint "south_room_template_id"
    t.bigint "west_room_template_id"
    t.bigint "above_room_template_id"
    t.bigint "below_room_template_id"
    t.index ["above_room_template_id"], name: "index_room_templates_on_above_room_template_id"
    t.index ["below_room_template_id"], name: "index_room_templates_on_below_room_template_id"
    t.index ["east_room_template_id"], name: "index_room_templates_on_east_room_template_id"
    t.index ["floor_template_id"], name: "index_room_templates_on_floor_template_id"
    t.index ["north_room_template_id"], name: "index_room_templates_on_north_room_template_id"
    t.index ["south_room_template_id"], name: "index_room_templates_on_south_room_template_id"
    t.index ["west_room_template_id"], name: "index_room_templates_on_west_room_template_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "floor_id", null: false
    t.bigint "room_template_id", null: false
    t.bigint "north_room_id"
    t.bigint "east_room_id"
    t.bigint "south_room_id"
    t.bigint "west_room_id"
    t.bigint "above_room_id"
    t.bigint "below_room_id"
    t.index ["above_room_id"], name: "index_rooms_on_above_room_id"
    t.index ["below_room_id"], name: "index_rooms_on_below_room_id"
    t.index ["east_room_id"], name: "index_rooms_on_east_room_id"
    t.index ["floor_id"], name: "index_rooms_on_floor_id"
    t.index ["north_room_id"], name: "index_rooms_on_north_room_id"
    t.index ["room_template_id"], name: "index_rooms_on_room_template_id"
    t.index ["south_room_id"], name: "index_rooms_on_south_room_id"
    t.index ["west_room_id"], name: "index_rooms_on_west_room_id"
  end

  create_table "traits", force: :cascade do |t|
    t.string "name", null: false
    t.string "explanation", null: false
  end

  add_foreign_key "dungeon_runs", "rooms", column: "current_room_id"
  add_foreign_key "dungeon_templates", "room_templates", column: "entrance_room_template_id"
  add_foreign_key "dungeons", "rooms", column: "entrance_room_id"
  add_foreign_key "monsters", "rooms", column: "current_room_id"
  add_foreign_key "room_templates", "room_templates", column: "above_room_template_id"
  add_foreign_key "room_templates", "room_templates", column: "below_room_template_id"
  add_foreign_key "room_templates", "room_templates", column: "east_room_template_id"
  add_foreign_key "room_templates", "room_templates", column: "north_room_template_id"
  add_foreign_key "room_templates", "room_templates", column: "south_room_template_id"
  add_foreign_key "room_templates", "room_templates", column: "west_room_template_id"
  add_foreign_key "rooms", "rooms", column: "above_room_id"
  add_foreign_key "rooms", "rooms", column: "below_room_id"
  add_foreign_key "rooms", "rooms", column: "east_room_id"
  add_foreign_key "rooms", "rooms", column: "north_room_id"
  add_foreign_key "rooms", "rooms", column: "south_room_id"
  add_foreign_key "rooms", "rooms", column: "west_room_id"
end
