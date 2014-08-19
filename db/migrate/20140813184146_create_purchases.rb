class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.column :product_id, :int
      t.column :customer_id, :int #moved
      t.column :cashier_id, :int #moved
      t.column :transaction, :int #appended
      t.column :quantity, :int
      t.column :date, :date #moved
      t.column :returned, :boolean
      t.timestamps
    end
  end
end
