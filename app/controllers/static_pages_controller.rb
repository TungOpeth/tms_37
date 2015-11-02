class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @user_subjects = UserSubject.where(["user_id = ?", current_user.id]).all
      @course_subjects = []
      @courses = []

       @user_subjects.each do |us|
         @course_subjects << CourseSubject.find(us.course_subject_id)
       end
       @course_subjects.each do |cs|
         @courses << Course.find(cs.course_id)
       end
       @courses = @courses.paginate page: params[:page]
    else
      redirect_to courses_path
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
