class AddLibroIdToComentario < ActiveRecord::Migration
  def change
    add_column :comentarios, :libro_id, :integer
  end
end
