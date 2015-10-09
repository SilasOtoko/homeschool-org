class AddAgeColumnToStudents < ActiveRecord::Migration
  def change
    add_column :students, :age, :integer
    add_column :students, :grade, :string
  end
end
