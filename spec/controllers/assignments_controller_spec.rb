require 'spec_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

# then, whenever you need to clean the DB
DatabaseCleaner.clean

describe AssignmentsController do
  describe "GET #index" do
    it "returns assignments of selected student" do
      session[:user_id] = Fabricate(:user).id
      student = Fabricate(:student)
      assignment = Fabricate(:assignment, student_id: student.id)
      assignment2 = Fabricate(:assignment, student_id: 2)
      homeschool = Fabricate(:homeschool)
      get :index, student_id: student.id 
      expect(assigns(:assignments).count).to eq(1)
    end
    
    it "redirects to log in if not signed in" do
      student = Fabricate(:student)
      assignment = Fabricate(:assignment, student_id: student.id)
      assignment2 = Fabricate(:assignment, student_id: 2)
      homeschool = Fabricate(:homeschool)
      get :index, student_id: student.id 
      expect(response).to redirect_to log_in_path
    end
  end
  
  describe "#GET show" do
    it "should return the assignment" do
      session[:user_id] = Fabricate(:user).id
      student = Fabricate(:student)
      assignment = Fabricate(:assignment, student_id: student.id)
      homeschool = Fabricate(:homeschool)
      get :show, student_id: student.id, id: assignment.id
      expect(assigns(:assignment)).to eq(assignment)
    end
    
    it "should redirect to log in if not logged in" do
      student = Fabricate(:student)
      assignment = Fabricate(:assignment, student_id: student.id)
      homeschool = Fabricate(:homeschool)
      get :show, student_id: student.id, id: assignment.id
      expect(response).to redirect_to log_in_path
    end
    
    it "should deny access if not user's student" do
      user = Fabricate(:user, homeschool_id: 1)
      session[:user_id] = user.id
      student = Fabricate(:student, homeschool_id: 3)
      assignment = Fabricate(:assignment, student_id: student.id)
      homeschool = Fabricate(:homeschool)
      get :show, student_id: student.id, id: assignment.id
      expect(response).to redirect_to dashboard_path
    end
  end
  
  describe "GET #edit" do
    it "should get correct assignment to edit" do
      session[:user_id] = Fabricate(:user).id
      homeschool = Fabricate(:homeschool)
      student = Fabricate(:student, homeschool_id: homeschool)
      assignment = Fabricate(:assignment, student_id: student.id)
      get :edit, student_id: student.id, id: assignment.id
      expect(assigns(:assignment)).to eq(assignment)
    end
  end
  
end