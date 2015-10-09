class HomeschoolsController < ApplicationController
  before_action :set_homeschool, only: [:show, :edit, :update]
  
  def show
  end
  
  def edit
  end
  
    def update
    if @homeschool.update(homeschool_params)
      flash[:notice] = "Your homeschool info has been updated."
      redirect_to dashboard_path
    else
      render 'edit'
    end
  end
  
  private
  
  def homeschool_params
    params.require(:homeschool).permit!
  end
  
  def set_homeschool
    @homeschool = Homeschool.find(params[:id])
  end
end