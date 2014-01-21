require 'spec_helper'

describe CoursesController do
  describe "GET index" do
    let(:course){FactoryGirl.create(:course)}

    it "assigns all courses as @courses" do
      get :index
      assigns(:courses).should eq([course])
    end
  end

  describe "GET show" do
    let(:course){FactoryGirl.create(:course)}

    it "assigns the requested item as @item" do
      get :show, {id: course.id}
      assigns(:course).should eq(course)
    end
  end

  describe "GET recommendation" do
    let(:course){FactoryGirl.create(:course)}
    let(:user){FactoryGirl.create(:user)}

    context "with login user" do
      it "assigns all courses as @courses" do
        session[:user_id] = user.id
        Course.stub(:recommended_for).and_return(Course.all)
        get :recommendation
        assigns(:courses).should eq([course])
      end
    end

    context "without login user" do
      it "assigns all courses as @courses" do
        session[:user_id] = nil
        get :recommendation
        response.should redirect_to(new_session_path)
      end
    end
  end
end
