class AddIdiomaToLibros < ActiveRecord::Migration
  def change
    add_column :libros, :idioma, :string
  end
end
