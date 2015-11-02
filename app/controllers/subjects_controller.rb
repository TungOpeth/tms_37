class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all.paginate page: params[:page]
  end
  def show
    @subject = Subject.find params[:id]
    @tasks = @subject.tasks
  end
end
