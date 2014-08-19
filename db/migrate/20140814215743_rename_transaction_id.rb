class RenameTransactionId < ActiveRecord::Migration
  def change
    rename_column :purchases, :transaction_id, :history_id
  end
end
