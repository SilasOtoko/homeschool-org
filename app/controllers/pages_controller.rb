class PagesController < ApplicationController
  def welcome
    
  end
  
  def dashboard
    @user = current_user
    @homeschool = @user.homeschool
  end
end