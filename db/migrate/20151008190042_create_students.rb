class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :assignment
      t.integer :gpa
      t.string :picture
      t.integer :homeschool_id
      
      t.timestamps
    end
  end
end
