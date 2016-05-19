class CreateComentariosTable < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.integer :user_id
      t.string :username
      t.text :comentario
    end
  end
end
