class CreateHistories < ActiveRecord::Migration
  def change
    create_table :transaction do |t|
      t.column :customer_id, :int
      t.column :cashier_id, :int
      t.column :date, :date
      t.timestamps
    end
  end
end
