class SubjectsController < ApplicationController
  before_action :load_object

  def index
    @subjects = Subject.all.paginate page: params[:page]
  end

  def show
    @subject = @course_subject.subject
    @course = @course_subject.course
    @tasks = @subject.tasks
    @user_tasks = @user_subject.user_tasks
  end

  def update
    if @user_subject.update_attributes user_subject_params
      redirect_to course_subject_path
    else
      flash[:danger] = t :Failed
      redirect_to course_subject_path
    end
  end

private
  def user_subject_params
    params.require(:user_subject).permit user_tasks_attributes: [:id, :status]
  end

  def load_object
    if user_signed_in?
      @course_subject = CourseSubject.find_by course_id: params[:course_id], subject_id: params[:id]
      @user_subject = current_user.user_subjects.find_by_course_subject_id @course_subject.id
    else
      flash[:danger] = t :login_please
       redirect_to new_user_session_path
    end
  end
end
