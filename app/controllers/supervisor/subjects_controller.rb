class Supervisor::SubjectsController < ApplicationController

  def index
    @subjects = Subject.all.paginate page: params[:page]
  end

  def show
    @users = User.all
    @subject = Subject.find params[:id]
    @tasks = @subject.tasks
    @course_subject = CourseSubject.find_by course_id: params[:course_id], subject_id: params[:id]
  end

  def new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = t :create_subject_success
      redirect_to supervisor_subjects_path
    else
      render 'new'
    end
  end

  def destroy
    Subject.find(params[:id]).destroy
    flash[:success] = t :subject_deleted
    redirect_to supervisor_subjects_path
  end

  def update
    if @subject.update user_subject_params
      flash[:success] = t "views.messages.update_successfully"
      redirect_to supervisor_course_subject_path
    else
      flash[:danger] = t "views.messages.failed"
      render :show
    end
  end

  private
    def init_course
      @course = Course.find params[:course_id]
    end

    def init_user_subject
      @user_subject = UserSubject.find_by user_id: current_user.id,
        subject_id: params[:id],course_id: params[:id]
    end

    def init_course_subject
      @course_subject = CourseSubject.find_by course_id: params[:course_id],
        subject_id: params[:id]
    end
    def user_subject_params
      params.require(:user_subject).permit user_tasks_attributes: [:id, :finished]
    end
    end
end
