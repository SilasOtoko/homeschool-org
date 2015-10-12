class AssignmentsController < ApplicationController
  before_action :require_user
  before_action :require_same_user
  
  def index
    @student = Student.find(params[:student_id])
    @assignments = Assignment.all.where(student_id: get_student.id)
  end
  
  def show
    @student = Student.find(params[:student_id])
    @assignment = Assignment.find(params[:id])
  end
  
  def new
    @student = Student.find(params[:student_id])
    @assignment = Assignment.new
  end
  
  def create
    @assignment = Assignment.new(assignment_params)
    @student = Student.find(params[:student_id])
    @assignment.student_id = @student.id

    if @assignment.save
      flash[:notice] = "Assignment Added"
      redirect_to student_assignments_path(@student)
    else
      render 'new'
    end
  end
  
  def edit
    @student = Student.find(params[:student_id])
    @assignment = Assignment.find(params[:id])
  end
  
  def update
    @student = Student.find(params[:student_id])
    @assignment = Assignment.find(params[:id])
    if @assignment.update(assignment_params)
      flash[:notice] = "Assignment Info updated"
      redirect_to student_assignments_path(@student)
    else
      render 'edit'
    end
  end
  
  def destroy
    @student = Student.find(params[:student_id])
    @assignment = Assignment.find(params[:id]).destroy
    flash[:success] = "Assignment deleted"
    redirect_to student_assignments_path(@student)
  end
  
  private
  
  def assignment_params
    params.require(:assignment).permit!
  end
  
  def get_student
    @student = Student.find(params[:student_id])
  end
  
  def require_same_user
    student = Student.find(params[:student_id])
    access_denied unless logged_in? and (current_user.homeschool == student.homeschool)
  end
end