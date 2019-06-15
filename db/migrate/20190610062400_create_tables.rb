class CreateTables < ActiveRecord::Migration[5.2]
  def change
  # create_table "building_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
  #   t.string "building_type"
  # end

  create_table "cities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "prefecture_id"
    t.integer "city_cd"
    t.string "city_name"
    t.index ["prefecture_id"], name: "index_cities_on_prefecture_id"
  end

  # create_table "constructions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
  #   t.string "construction"
  # end

  create_table "genders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "gender"
  end

  # create_table "layouts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
  #   t.string "layout"
  # end

  # create_table "olds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
  #   t.string "old"
  # end

  create_table "prefectures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "pref_name"
  end

  create_table "rent_houses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    # t.bigint "construction_id"
    t.bigint "prefecture_id", null: false
    t.bigint "city_id", null: false
    # t.bigint "walk_time_id"
    # t.bigint "layout_id"
    # t.bigint "building_type_id"
    # t.bigint "old_id"
    t.string "station_name", null: false
    t.string "line_name"
    t.integer "rent", null: false
    t.integer "management_fee"
    t.integer "else_fee"
    # t.string "separate"
    # t.integer "floor"
    # t.string "woman"
    # t.string "balconi"
    # t.string "daylight"
    t.text "comment"
    # t.string "room_size"
    t.string "building_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    # t.index ["building_type_id"], name: "index_rent_houses_on_building_type_id"
    t.index ["city_id"], name: "index_rent_houses_on_city_id"
    # t.index ["construction_id"], name: "index_rent_houses_on_construction_id"
    # t.index ["layout_id"], name: "index_rent_houses_on_layout_id"
    # t.index ["old_id"], name: "index_rent_houses_on_old_id"
    t.index ["prefecture_id"], name: "index_rent_houses_on_prefecture_id"
    t.index ["user_id"], name: "index_rent_houses_on_user_id"
    # t.index ["walk_time_id"], name: "index_rent_houses_on_walk_time_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gender_id", null: false
    t.string "nickname", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["gender_id"], name: "index_users_on_gender_id"
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  # create_table "walk_times", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
  #   t.string "walk_time"
  # end

  add_foreign_key "cities", "prefectures"
  # add_foreign_key "rent_houses", "building_types"
  add_foreign_key "rent_houses", "cities"
  # add_foreign_key "rent_houses", "constructions"
  # add_foreign_key "rent_houses", "layouts"
  # add_foreign_key "rent_houses", "olds"
  add_foreign_key "rent_houses", "prefectures"
  add_foreign_key "rent_houses", "users"
  # add_foreign_key "rent_houses", "walk_times"
  end
end
