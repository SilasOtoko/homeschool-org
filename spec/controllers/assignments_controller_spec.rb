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
    
    it "redirects to students page if no student" do
      session[:user_id] = Fabricate(:user).id
      assignment = Fabricate(:assignment)
      homeschool = Fabricate(:homeschool)
      get :index, student_id: nil
      expect(response).to redirect_to students_path(homeschool)
    end
  end
end