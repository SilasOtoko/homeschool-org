class Student < ActiveRecord::Base
  belongs_to :homeschool
  has_many :assignments
end