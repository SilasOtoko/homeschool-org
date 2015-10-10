class AssignmentsController < ApplicationController
  def index
    @assignment = Assignment.find_by(params[:id])
    @assignments = Assignment.all.where(student_id: get_student.id)
  end
  
  def show
    
  end
  
  def new
    @assignment = Assignment.new
  end
  
  def create
    @assignment = Assignment.new(assignment_params)
    @student = Student.find_by(params[:id])
    @assignment.student = @student

    if @assignment.save
      flash[:notice] = "Assignment Added"
      redirect_to student_path(@student)
    else
      render 'new'
    end
  end
  
  private
  
  def assignment_params
    params.require(:assignment).permit!
  end
  
  def get_student
    @student = Student.find_by(params[:id])
  end
end