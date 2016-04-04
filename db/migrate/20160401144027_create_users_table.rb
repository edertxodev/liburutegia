class CreateUsersTable < ActiveRecord::Migration
  def change
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
