class ChangeSolicitudesTable < ActiveRecord::Migration
  def self.up
    rename_table :solicitudes, :solicituds
  end 
  def self.down
    rename_table :solicitudes, :solicituds
  end
end
