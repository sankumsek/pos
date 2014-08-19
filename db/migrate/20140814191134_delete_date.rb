class DeleteDate < ActiveRecord::Migration
  def change
    remove_column :transaction, :date
  end
end
