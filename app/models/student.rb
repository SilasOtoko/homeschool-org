class Student < ActiveRecord::Base
  belongs_to :homeschool
  has_many :assignments
  
  mount_uploader :avatar, AvatarUploader
end