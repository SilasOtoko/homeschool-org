class HomeschoolsController < ApplicationController
  def show
    @homeschool = Homeschool.find(params[:id])
  end
end