class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])  
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    User.set_homeschool_id(@user) if @user.new_record?
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end