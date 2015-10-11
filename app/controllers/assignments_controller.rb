class AssignmentsController < ApplicationController
  def index
    @assignments = Assignment.all.where(student_id: get_student.id)
  end
  
  def show
    @assignment = Assignment.find(params[:id])
  end
  
  def new
    @assignment = Assignment.new
  end
  
  def create
    @assignment = Assignment.new(assignment_params)
    @student = Student.find_by(params[:id])
    @assignment.student_id = @student.id

    if @assignment.save
      flash[:notice] = "Assignment Added"
      redirect_to assignments_path
    else
      render 'new'
    end
  end
  
  def edit
    @assignment = Assignment.find(params[:id])
  end
  
  def update
    @assignment = Assignment.find(params[:id])
    if @assignment.update(assignment_params)
      flash[:notice] = "Assignment Info updated"
      redirect_to assignments_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @assignment = Assignment.find(params[:id]).destroy
    flash[:success] = "Assignment deleted"
    redirect_to assignments_path
  end
  
  private
  
  def assignment_params
    params.require(:assignment).permit!
  end
  
  def get_student
    @student = Student.find(params[:student_id])
  end
end