class CreateLibros < ActiveRecord::Migration
  def change
    create_table "libros", force: :cascade do |t|
    	t.string   "titulo",     limit: 255
	    t.string   "autor",      limit: 255
	    t.string   "genero",     limit: 255
	    t.integer  "isbn",       limit: 4
	    t.string   "portada",    limit: 255
	    t.date     "fregistro"
	    t.datetime "created_at",             null: false
	    t.datetime "updated_at",             null: false
	end
  end
end
