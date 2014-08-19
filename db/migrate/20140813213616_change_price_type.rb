class ChangePriceType < ActiveRecord::Migration
  def change
    change_column :products, :price, :floatrake db:test:prepare
  end
end
