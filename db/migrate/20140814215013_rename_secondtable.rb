class RenameSecondtable < ActiveRecord::Migration
  def change
    rename_table :history, :histories
  end
end
