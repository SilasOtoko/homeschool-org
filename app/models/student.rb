class Student < ActiveRecord::Base
  belongs_to :homeschool
  has_many :assignments
  
  accepts_nested_attributes_for :assignments
  
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  has_attached_file :document
  validates_attachment :document, content_type: {content_type: %w(image/jpeg image/jpg image/png application/txt text/plain application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
end