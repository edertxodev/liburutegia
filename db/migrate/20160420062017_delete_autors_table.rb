class DeleteAutorsTable < ActiveRecord::Migration
  def change
    drop_table :autors
  end
end
