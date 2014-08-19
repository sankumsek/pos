class DeleteReturns < ActiveRecord::Migration
  def change
    remove_column :purchases, :returned
  end
end
