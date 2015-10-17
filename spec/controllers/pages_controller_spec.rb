require 'spec_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

# then, whenever you need to clean the DB
DatabaseCleaner.clean

describe PagesController do
  describe "GET #welcome"
  it "redirects to dashboard if already logged in" do
    homeschool = Fabricate(:homeschool)
    session[:user_id] = Fabricate(:user, homeschool_id: homeschool.id).id
    get :welcome
    expect(response).to redirect_to dashboard_path
  end
end