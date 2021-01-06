# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_05_001759) do

  create_table "attacks", force: :cascade do |t|
    t.string "name"
    t.integer "max"
    t.integer "min"
    t.string "image"
    t.integer "npc_id"
    t.index ["npc_id"], name: "index_attacks_on_npc_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "image"
  end

  create_table "npcs", force: :cascade do |t|
    t.string "name"
    t.string "character_class"
    t.integer "ally"
    t.string "image"
    t.integer "location_id"
    t.index ["location_id"], name: "index_npcs_on_location_id"
  end

end
