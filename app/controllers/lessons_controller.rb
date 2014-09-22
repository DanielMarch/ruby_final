class LessonsController < ApplicationController
  before_filter :require_login
  before_action :load_course

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = @course.lessons.build(lesson_params)
    if @lesson.save
      redirect_to edit_course_path(@course)
    else
      render :new
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to edit_course_path(@course)
    else
      render :edit
    end
  end

  def destroy
    lesson = Lesson.find(params[:id])
    lesson.destroy!
    redirect_to edit_course_path(@course)
  end

  protected

  def lesson_params
    params.require(:lesson).permit(:title, :content)
  end

  def load_course
    @course = Course.find(params[:course_id])
  end
end
