class FixStudentsTable < ActiveRecord::Migration
  def change
    add_column :students, :description, :text
    remove_column :students, :image_file_name
    remove_column :students, :image_content_type
    remove_column :students, :image_file_size
    remove_column :students, :image_updated_at
    remove_column :students, :document_file_name
    remove_column :students, :document_content_type
    remove_column :students, :document_file_size
    remove_column :students, :document_updated_at
  end
end
