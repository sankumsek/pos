class CreateCashierName < ActiveRecord::Migration
  def change
    add_column :cashiers, :name, :varchar
  end
end
