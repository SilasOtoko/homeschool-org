require 'spec_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

# then, whenever you need to clean the DB
DatabaseCleaner.clean

describe AssignmentsController do
  let!(:homeschool) { Fabricate(:homeschool) }
  let!(:student) { Fabricate(:student, homeschool_id: homeschool.id) }
  let!(:assignment) { Fabricate(:assignment, student_id: student.id) }
  
  describe "GET #index" do
    it "returns assignments of selected student" do
      user = Fabricate(:user, homeschool_id: homeschool.id)
      session[:user_id] = user.id
      assignment2 = Fabricate(:assignment, student_id: 2)
      get :index, student_id: student.id 
      expect(assigns(:assignments).count).to eq(1)
    end
    
    it_behaves_like "requires sign in" do
      let(:action) { get :index, id: assignment.id, student_id: student.id }
    end
  end
  
  describe "#GET show" do
    it "should return the assignment" do
      session[:user_id] = Fabricate(:user, homeschool_id: homeschool.id).id
      get :show, student_id: student.id, id: assignment.id
      expect(assigns(:assignment)).to eq(assignment)
    end
    
    it_behaves_like "requires sign in" do
      let(:action) { get :show, id: assignment.id, student_id: student.id }
    end
    
    it "should deny access if not user's student" do
      user = Fabricate(:user, homeschool_id: 1)
      session[:user_id] = user.id
      student = Fabricate(:student, homeschool_id: 3)
      get :show, student_id: student.id, id: assignment.id
      expect(response).to redirect_to dashboard_path
    end
  end
  
  describe "GET #edit" do
    it "should get correct assignment to edit" do
      user = Fabricate(:user, homeschool_id: homeschool.id)
      session[:user_id] = user.id
      get :edit, student_id: student.id, id: assignment.id
      expect(assigns(:assignment)).to eq(assignment)
    end
  end
  
end