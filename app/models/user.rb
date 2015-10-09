class User < ActiveRecord::Base
  belongs_to :homeschool
  
  has_secure_password
  
  validates_presence_of :email, :password, :username
  validates_uniqueness_of :email
  
  def self.set_homeschool_id(user)
    homeschool = Homeschool.create(name: "#{user.username}'s Homeschool")
    user.homeschool_id = homeschool.id
  end
end