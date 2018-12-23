# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_12_23_222804) do

  create_table "admin", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "user", limit: 50, null: false
    t.string "password", limit: 32, null: false
  end

  create_table "charges", options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "user_id"
    t.string "stripe_id"
    t.integer "amount"
    t.string "card_brand"
    t.string "card_last4"
    t.string "card_exp_month"
    t.string "card_exp_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_charges_on_user_id"
  end

  create_table "departamentos", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "nombre", limit: 100, null: false
  end

  create_table "farmacias_departamentos", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "id_farmacia", null: false
    t.integer "id_departamento", null: false
    t.index ["id_departamento"], name: "id_departamento"
    t.index ["id_farmacia"], name: "id_farmacia"
  end

  create_table "general", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "valor", limit: 200, null: false
  end

  create_table "generals", id: :string, limit: 100, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "valor", limit: 200, null: false
  end

  create_table "links", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "site", limit: 100, null: false
    t.string "url", limit: 500, null: false
    t.datetime "fecha_inicio", null: false
    t.datetime "ultima_revision", null: false
    t.string "id_padre", limit: 80, null: false
    t.string "nombre", limit: 300
    t.float "precio"
    t.string "img", limit: 300
    t.string "id_referencia", limit: 50
    t.boolean "disponibilidad"
  end

  create_table "precios", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "id_link", null: false
    t.float "precio", null: false
    t.date "fecha", null: false
    t.index ["id_link"], name: "id_link"
  end

  create_table "products", options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "stripe_id"
    t.string "stripe_subscription_id"
    t.string "card_brand"
    t.string "card_last4"
    t.string "card_exp_month"
    t.string "card_exp_year"
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
