class AddAssignmentUrlToAssigments < ActiveRecord::Migration
  def change
    add_column :assignments, :assignment, :string
    remove_column :assignments, :file, :string
  end
end
