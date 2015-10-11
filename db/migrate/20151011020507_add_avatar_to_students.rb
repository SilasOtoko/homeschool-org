class AddAvatarToStudents < ActiveRecord::Migration
  def change
    add_column :students, :avatar, :string
    remove_column :students, :picture
  end
end
