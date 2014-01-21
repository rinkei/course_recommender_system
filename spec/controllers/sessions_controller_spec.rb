require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end

    it "assigns a new user as @user" do
      get :new
      assigns(:user).should be_a_new(User)
    end
  end

  describe "POST create" do
    context "with persisted user's email and correct password" do
      let(:user){FactoryGirl.create(:user)}

      it "assigns the requested user as @user" do
        post :create, {user: {email: user.email, password: user.password}}
        assigns(:user).should eql(user)
      end

      it "redirects to root" do
        post :create, {user: {email: user.email, password: user.password}}
        response.should redirect_to(root_path)
      end
    end

    context "with persisted user's email and wrong password" do
      let(:user){FactoryGirl.create(:user)}
      let(:wrong_user_password){"wrong#{user.password}"}

      it "assigns a new user as @user" do
        post :create, {user: {email: user.email, password: wrong_user_password}}
        assigns(:user).should_not eql(user)
        assigns(:user).should be_a_new(User)
      end

      it "renders new" do
        post :create, {user: {email: user.email, password: wrong_user_password}}
        response.should render_template('new')
      end
    end

    context "with not persisted user's email and password" do
      let(:user){FactoryGirl.build(:user)}

      it "assigns a new user as @user" do
        post :create, {user: {email: user.email, password: user.password}}
        assigns(:user).should_not eql(user)
        assigns(:user).should be_a_new(User)
      end

      it "renders new" do
        post :create, {user: {email: user.email, password: user.password}}
        response.should render_template('new')
      end
    end
  end

  describe "DELETE destroy" do
    let(:user){FactoryGirl.create(:user)}

    before(:each) do
      session[:user_id] = user.id
    end

    it "destroys the requested user's session" do
      delete :destroy
      assigns(:current_user).should be_nil
    end

    it "redirects to root" do
      delete :destroy
      response.should redirect_to(root_path)
    end
  end
end
