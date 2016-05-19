class AddTimestampToComentario < ActiveRecord::Migration
  def change
    add_column :comentarios, :created_at, :datetime
      add_column :comentarios, :updated_at, :datetime
  end
end
