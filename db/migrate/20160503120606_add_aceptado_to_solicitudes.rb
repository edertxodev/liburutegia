class AddAceptadoToSolicitudes < ActiveRecord::Migration
  def change
    add_column :solicituds, :aceptado, :boolean, default: false
  end
end
