class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.column :login, :varchar
      t.timestamps
    end
  end
end
