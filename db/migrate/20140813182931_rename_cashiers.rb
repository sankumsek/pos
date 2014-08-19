class RenameCashiers < ActiveRecord::Migration
  def change
    rename_table :tasks, :cashiers
  end
end
