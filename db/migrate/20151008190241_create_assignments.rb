class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.string :file
      t.integer :grade
      t.text :comments
      t.integer :student_id
      
      t.timestamps
    end
  end
end
