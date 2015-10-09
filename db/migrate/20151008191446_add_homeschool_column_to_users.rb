class AddHomeschoolColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :homeschool_id, :integer
  end
end
