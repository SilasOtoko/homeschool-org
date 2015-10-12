class Assignment < ActiveRecord::Base
  belongs_to :student
  
  mount_uploader :assignment, AssignmentUploader
  
  validates_presence_of :name
end