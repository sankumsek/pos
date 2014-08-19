class ChangeTablename < ActiveRecord::Migration
  def change
    rename_table :transactions, :cashiers
  end
end
