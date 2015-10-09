class Homeschool < ActiveRecord::Base
  belongs_to :community
  has_one :teacher, class_name: 'User'
  has_many :students
end