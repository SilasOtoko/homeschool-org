class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:email].downcase)
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: 'You have successfully logged in!'
    else
      flash[:error] = "Invalid email or username"
      redirect_to log_in_path
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end