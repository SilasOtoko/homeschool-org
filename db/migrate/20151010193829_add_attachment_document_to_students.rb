class AddAttachmentDocumentToStudents < ActiveRecord::Migration
  def self.up
    change_table :students do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :students, :document
  end
end
