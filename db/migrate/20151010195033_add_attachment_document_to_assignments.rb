class AddAttachmentDocumentToAssignments < ActiveRecord::Migration
  def self.up
    change_table :assignments do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :assignments, :document
  end
end
