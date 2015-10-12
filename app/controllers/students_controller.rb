class StudentsController < ApplicationController
  before_action :require_user
  before_action :require_same_user, except: [:index, :new, :create]
  
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
  
  def edit
    @student = Student.find(params[:id])
  end
  
  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      flash[:notice] = "Student Info updated"
      redirect_to student_path(@student)
    else
      render 'edit'
    end
  end
  
  private
  
  def student_params
    params.require(:student).permit!
  end
  
  def require_same_user
    homeschool = current_user.homeschool
    student = Student.find(params[:id])
    access_denied unless logged_in? and (current_user.homeschool == student.homeschool)
  end
end