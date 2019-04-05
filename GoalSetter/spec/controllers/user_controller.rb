require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  user = User.create!(username: 'Anthony', password: 'hunter12')
  describe "GET #index" do
    it "renders all users" do
      get :index
      expect(response).to be_success
      expect(response).to render_template(:index)
    end
  end


  describe "POST #create" do
    user = User.find_by(username: 'Anthony')

    context "with valid parameters" do
      post :create, params: { user: { username: 'Anthony', password: 'hunter12' } }

      it "redirect to users_url" do
       expect(response).to redirect_to(user_url(User.find_by(username: 'Anthony')))
    end

    context "with invalid parameters" do
      post :create, params: { user: { username: 'Anthony', password: 'him' } }
      it "allow user to sign up again" do
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #new" do
    it "renders new form" do
      expect(response).to render_template(:new)
    end
  end

  describe "DELETE #destroy" do
    current_user = User.find(params[:user][:username], params[:user][:password])
    context "user is the curent_user" do
      it "should logout the user" do
        expect(response).to redirect_to(users_url)
      end
      it "should destory the user" do
        expect(user).to_be nil
      end
    end
  end
end
