class CoursesController < ApplicationController
  before_action :require_login, only: %w(recommendation)

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def recommendation
    @courses = Course.all #recommended_for(current_user)
  end
end
