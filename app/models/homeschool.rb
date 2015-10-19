class Homeschool < ActiveRecord::Base
  belongs_to :community
  has_one :teacher, class_name: 'User'
  has_many :students
  has_many :calendar_entries
  
  validates_presence_of :name
end