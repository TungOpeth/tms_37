class CoursesController < ApplicationController
  def index
    @courses = Course.paginate page: params[:page]
  end
  def show
    @course = Course.find params[:id]
    @course_subjects = @course.course_subjects
    @subjects = []

  end
end
