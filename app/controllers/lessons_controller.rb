class LessonsController < ApplicationController
  before_filter :require_login
  before_action :load_course

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = @course.lessons.build(lesson_params)
    if @lesson.save
      redirect_to root_path
    else
      render :new
    end
  end

  protected

  def lesson_params
    params.require(:lesson).permit(:title, :content)
  end

  def load_course
    @course = Course.find(params[:course_id])
  end
end
