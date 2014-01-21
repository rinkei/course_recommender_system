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
end
