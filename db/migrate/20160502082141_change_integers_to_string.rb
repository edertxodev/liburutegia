class ChangeIntegersToString < ActiveRecord::Migration
  def change
    change_column :solicituds, :libro_id, :string
    change_column :solicituds, :user_id, :string
  end
end
