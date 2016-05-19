class CreateLeidos < ActiveRecord::Migration
  def change
    create_table :leidos do |t|
      t.integer :user_id
      t.integer :libro_id
      t.string :username
      t.string :libro
      t.datetime :fecha_leido

      t.timestamps null: false
    end
  end
end
