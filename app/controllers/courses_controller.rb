class CoursesController < ApplicationController
  before_filter :require_login

  def new
    @course = Course.new
  end

  def index
    @courses = Course.all
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to new_course_path
    else
      redirect_to root_path
    end
  end

  protected

  def course_params
    params.require(:course).permit(:title, :subject)
  end
end
