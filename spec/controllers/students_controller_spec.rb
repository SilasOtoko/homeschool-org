require 'spec_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

# then, whenever you need to clean the DB
DatabaseCleaner.clean

describe StudentsController do
  let!(:homeschool) { Fabricate(:homeschool) }
  let!(:student) { Fabricate(:student, homeschool_id: homeschool.id) }
  
  describe "GET #index" do
    it "returns students belonging to homeschool" do
      session[:user_id] = Fabricate(:user, homeschool_id: homeschool.id).id
      student2 = Fabricate(:student, homeschool_id: homeschool.id)
      get :index, homeschool_id: homeschool
      expect(assigns(:students)).to match_array([student, student2])
    end
    
    it_behaves_like "requires sign in" do
      let(:action) { get :index }
    end
  end
  
  describe "#GET show" do
    it "should return the student" do
      session[:user_id] = Fabricate(:user, homeschool_id: homeschool.id).id
      student2= Fabricate(:student, homeschool_id: homeschool.id)
      get :show, id: student.id
      expect(assigns(:student)).to eq(student)
    end
    
    it_behaves_like "requires sign in" do
      let(:action) { get :show, id: student.id }
    end
    
    it "should deny access if not user's student" do
      session[:user_id] = Fabricate(:user, homeschool_id: homeschool.id).id
      student = Fabricate(:student, homeschool_id: 3)
      get :show, id: student.id, homeschool_id: homeschool.id
      expect(response).to redirect_to dashboard_path
    end
  end
  
  describe "GET #edit" do
    it "should get correct assignment to edit" do
      session[:user_id] = Fabricate(:user, homeschool_id: homeschool.id).id
      student2 = Fabricate(:student, homeschool_id: homeschool.id)
      get :edit, id: student.id
      expect(assigns(:student)).to eq(student)
    end
    
    it "should deny access if not user's student" do
      user = Fabricate(:user, homeschool_id: 1)
      session[:user_id] = user.id
      student = Fabricate(:student, homeschool_id: 3)
      get :edit, id: student.id, homeschool_id: homeschool.id
      expect(response).to redirect_to dashboard_path
    end
    
    it_behaves_like "requires sign in" do
      let(:action) { get :edit, id: student.id }
    end
  end
end