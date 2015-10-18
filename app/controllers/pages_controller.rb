class PagesController < ApplicationController
  before_action :to_dashboard, only: [:welcome]
  before_action :require_user, only: [:dashboard]
  
  def welcome
    
  end
  
  def dashboard
    @user = current_user
    @homeschool = @user.homeschool
  end
  
  def calendar
    @homeschool = current_user.homeschool
  end
  
  private
  
  def to_dashboard
    if logged_in?
      redirect_to dashboard_path
    end
  end
end