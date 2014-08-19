class AlterPurchases < ActiveRecord::Migration
  def change
    rename_column :purchases, :transaction, :transaction_id
    remove_column :purchases, :customer_id
    remove_column :purchases, :cashier_id
    remove_column :purchases, :date
  end
end
