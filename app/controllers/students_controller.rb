class StudentsController < ApplicationController
  def index
    @homeschool = current_user.homeschool
    @students = Student.all.where(homeschool_id: @homeschool.id)
  end
  
  def new
    @student = Student.new
  end

  def create
    @students = Student.new(student_params)
    @students.homeschool = current_user.homeschool

    if @students.save
      flash[:notice] = "Student Added"
      redirect_to students_path
    else
      render 'new'
    end
  end
  
  def show
    @homeschool = current_user.homeschool
    @student = Student.find(params[:id])
  end
  
  private
  
  def student_params
    params.require(:student).permit!
  end
end