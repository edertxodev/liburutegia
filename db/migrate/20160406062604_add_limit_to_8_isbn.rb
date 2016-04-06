class AddLimitTo8Isbn < ActiveRecord::Migration
  def change
    change_column :libros, :isbn, :integer, :limit => 8
  end
end
