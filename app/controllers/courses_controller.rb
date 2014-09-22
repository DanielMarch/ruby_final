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
      redirect_to courses_path
    else
      render :new
    end
  end

  def edit
    @course = Course.find_by_id(params[:id])
    if @course.nil?
      redirect_to courses_path
    end
  end

  def show
    @course = Course.find_by_id(params[:id])
  end

  def update
    @course = Course.find_by_id(params[:id])
    if @course.update_attributes(course_params)
      redirect_to courses_path
    else
      render 'edit'
    end
  end

  def destroy
    course = Course.find(params[:id])
    course.destroy!
    redirect_to courses_path
  end

  protected

  def course_params
    params.require(:course).permit(:title, :subject)
  end
end
