class TasksController < ApplicationController
  def index

  end

  def show
    @task = Task.find params[:id]
  end

  def update
  end

    private

    def task_params
      params.require(:task).permit :name, :subject_id
    end
end
