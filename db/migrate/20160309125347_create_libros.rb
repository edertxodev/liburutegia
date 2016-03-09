class CreateLibros < ActiveRecord::Migration
  def change
    create_table :libros do |t|
      t.string :titulo
      t.string :autor
      t.string :genero
      t.integer :isbn
      t.string :portada
      t.date :fregistro

      t.timestamps null: false
    end
  end
end
