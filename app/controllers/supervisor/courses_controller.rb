class Supervisor::CoursesController < ApplicationController

  def index
    @courses = Course.paginate page: params[:page]
  end

  def new
    @course = Course.new
    @subjects = Subject.all

    @subjects.each do |subject|
      @course.course_subjects.build subject: subject
    end
  end

 def create
    @course = Course.new course_params

    if @course.save
      flash[:success] = t :course_create
      redirect_to supervisor_courses_path
    else
      @subjects = Subject.paginate page: params[:page]
      render :new
    end
  end

  def show
    @course = Course.find params[:id]
    @course_subjects = @course.course_subjects
    @subjects = []

  end

  def edit
    @course = Course.find params[:id]
  end

  def update
    @course = Course.find params[:id]
    if params[:method] == "start_course"
      @course.update_attributes status: Course::STARTED
      flash[:success] = t :course_start
      redirect_to supervisor_courses_path
    else
      @course.update_attributes course_params
      flash[:success] = t :course_update
      redirect_to supervisor_courses_path
    end
  end

  def destroy
    @course = Course.find params[:id]
    @course.destroy
    flash[:success] = t :course_delete
    redirect_to request.referrer || root_url
  end

  private
  def course_params
    params.require(:course).permit(:name, :instruction, :start_date, :end_date,
      course_subjects_attributes: [:id, :subject_id])
  end
end
