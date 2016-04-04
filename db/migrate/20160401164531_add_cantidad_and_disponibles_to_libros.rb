class AddCantidadAndDisponiblesToLibros < ActiveRecord::Migration
  def change
  	add_column :libros, :cantidad, :integer, :default => 0
  	add_column :libros, :disponibles, :integer
  end
end
