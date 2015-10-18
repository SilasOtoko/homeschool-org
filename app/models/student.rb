class Student < ActiveRecord::Base
  belongs_to :homeschool
  has_many :assignments
  
  mount_uploader :avatar, AvatarUploader
  
  validates_presence_of :name, :age
end