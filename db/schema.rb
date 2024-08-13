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

ActiveRecord::Schema[7.0].define(version: 2024_08_06_180547) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "battles", force: :cascade do |t|
    t.bigint "save_file_id", null: false
    t.integer "initiative", default: 0, null: false
    t.index ["save_file_id"], name: "index_battles_on_save_file_id"
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
    t.bigint "npc_template_id", null: false
    t.bigint "item_template_id", null: false
    t.integer "percent_chance", default: 100, null: false
    t.integer "quantity", default: 1, null: false
    t.index ["item_template_id"], name: "index_drops_on_item_template_id"
    t.index ["npc_template_id"], name: "index_drops_on_npc_template_id"
  end

  create_table "encounters", force: :cascade do |t|
    t.bigint "tile_template_id", null: false
    t.bigint "npc_template_id", null: false
    t.integer "percent_chance", default: 100, null: false
    t.index ["npc_template_id"], name: "index_encounters_on_npc_template_id"
    t.index ["tile_template_id"], name: "index_encounters_on_tile_template_id"
  end

  create_table "event_logs", force: :cascade do |t|
    t.bigint "save_file_id", null: false
    t.string "message", null: false
    t.datetime "created_at", null: false
    t.index ["save_file_id"], name: "index_event_logs_on_save_file_id"
  end

  create_table "item_templates", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.integer "value", default: 0, null: false
    t.boolean "stackable", default: false, null: false
    t.string "equipment_slot"
    t.integer "base_armor_rating", default: 0, null: false
    t.integer "base_damage_rating", default: 0, null: false
    t.index ["equipment_slot"], name: "index_item_templates_on_equipment_slot"
    t.index ["name"], name: "index_item_templates_on_name"
  end

  create_table "items", force: :cascade do |t|
    t.string "owner_type", null: false
    t.bigint "owner_id", null: false
    t.bigint "item_template_id", null: false
    t.integer "quantity", default: 1, null: false
    t.boolean "equipped", default: false, null: false
    t.index ["item_template_id"], name: "index_items_on_item_template_id"
    t.index ["owner_type", "owner_id"], name: "index_items_on_owner"
  end

  create_table "map_templates", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.integer "start_x", default: 0, null: false
    t.integer "start_y", default: 0, null: false
    t.integer "start_z", default: 0, null: false
  end

  create_table "maps", force: :cascade do |t|
    t.bigint "save_file_id", null: false
    t.bigint "map_template_id", null: false
    t.index ["map_template_id"], name: "index_maps_on_map_template_id"
    t.index ["save_file_id"], name: "index_maps_on_save_file_id"
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

  create_table "non_player_characters", force: :cascade do |t|
    t.bigint "save_file_id", null: false
    t.bigint "npc_template_id", null: false
    t.bigint "location_id"
    t.integer "max_hp", default: 10, null: false
    t.integer "damage_rating", default: 0, null: false
    t.integer "armor_rating", default: 0, null: false
    t.integer "speed_rating", default: 10, null: false
    t.integer "current_hp", default: 10, null: false
    t.index ["location_id"], name: "index_non_player_characters_on_location_id"
    t.index ["npc_template_id"], name: "index_non_player_characters_on_npc_template_id"
    t.index ["save_file_id"], name: "index_non_player_characters_on_save_file_id"
  end

  create_table "npc_templates", force: :cascade do |t|
    t.string "name", null: false
    t.integer "base_experience_yield", default: 0, null: false
    t.integer "level", default: 1, null: false
    t.integer "base_hp", default: 10, null: false
    t.integer "base_damage_rating", default: 0, null: false
    t.integer "base_armor_rating", default: 0, null: false
    t.integer "base_speed_rating", default: 10, null: false
  end

  create_table "personality_traits", force: :cascade do |t|
    t.string "owner_type", null: false
    t.bigint "owner_id", null: false
    t.bigint "trait_id", null: false
    t.index ["owner_type", "owner_id"], name: "index_personality_traits_on_owner"
    t.index ["trait_id"], name: "index_personality_traits_on_trait_id"
  end

  create_table "player_characters", force: :cascade do |t|
    t.bigint "save_file_id", null: false
    t.string "name", null: false
    t.integer "body", default: 1, null: false
    t.integer "mind", default: 1, null: false
    t.integer "spirit", default: 1, null: false
    t.integer "current_hp", default: 10, null: false
    t.integer "level", default: 1, null: false
    t.integer "xp", default: 0, null: false
    t.integer "bonus_skill_points", default: 0, null: false
    t.integer "max_hp", default: 10, null: false
    t.integer "damage_rating", default: 0, null: false
    t.integer "armor_rating", default: 0, null: false
    t.integer "speed_rating", default: 0, null: false
    t.index ["save_file_id"], name: "index_player_characters_on_save_file_id"
  end

  create_table "save_files", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "location_id"
    t.index ["location_id"], name: "index_save_files_on_location_id"
  end

  create_table "tile_templates", force: :cascade do |t|
    t.bigint "map_template_id", null: false
    t.string "name"
    t.string "description"
    t.integer "x", null: false
    t.integer "y", null: false
    t.integer "z", null: false
    t.index ["map_template_id"], name: "index_tile_templates_on_map_template_id"
  end

  create_table "tiles", force: :cascade do |t|
    t.bigint "map_id", null: false
    t.bigint "tile_template_id", null: false
    t.index ["map_id"], name: "index_tiles_on_map_id"
    t.index ["tile_template_id"], name: "index_tiles_on_tile_template_id"
  end

  create_table "traits", force: :cascade do |t|
    t.string "name", null: false
    t.string "explanation", null: false
  end

  add_foreign_key "save_files", "tiles", column: "location_id"
end
