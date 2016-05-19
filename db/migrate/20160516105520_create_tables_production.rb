class CreateTablesProduction < ActiveRecord::Migration
  def change
    create_table "comentarios", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "username"
    t.text     "comentario"
    t.integer  "libro_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leidos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "libro_id"
    t.string   "username"
    t.string   "libro"
    t.datetime "fecha_leido"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "libros", force: :cascade do |t|
    t.string   "titulo",      limit: 255
    t.string   "autor",       limit: 255
    t.string   "genero",      limit: 255
    t.integer  "isbn",        limit: 8
    t.string   "portada",     limit: 255
    t.date     "fregistro"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "cantidad",                default: 0
    t.integer  "disponibles"
    t.string   "idioma"
  end

  create_table "solicituds", force: :cascade do |t|
    t.string   "libro_id"
    t.string   "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "username"
    t.string   "libro"
    t.boolean  "aceptado",        default: false
    t.datetime "fechadevolucion"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: ""
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "username",               limit: 255
    t.string   "nombre",                 limit: 255
    t.string   "apellidos",              limit: 255
    t.string   "avatar",                 limit: 255
    t.string   "role",                   limit: 255
  end
  end
end
