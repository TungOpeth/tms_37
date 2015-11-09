class Supervisor::AssigneesController < ApplicationController
  before_action :load_object

  def show
    @users = User.all
  end

  def update
    if @course.update_attributes assignees_params
      flash[:success] = t :create_subject_success
      redirect_to supervisor_course_assignees_path(@course)
    else
      render 'new'
    end
  end

  private
  def assignees_params
    params.require(:course).permit :user_ids => []
  end

  def load_object
    @course = Course.find params[:course_id]
  end
end
