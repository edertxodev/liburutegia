class CreateSolicituds < ActiveRecord::Migration
  def change
    create_table :solicitudes do |t|
      t.integer :libro_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
