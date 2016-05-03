class AddUserAndLibroToSolicitudes < ActiveRecord::Migration
  def change
    add_column :solicituds, :username, :string
    add_column :solicituds, :libro, :string
  end
end
