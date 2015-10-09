class PagesController < ApplicationController
  def login
    
  end
  
  def dashboard
    @user = User.find_by(session[:user_id])
  end
end