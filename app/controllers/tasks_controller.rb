class TasksController < ApplicationController
  before_action :set_task_list
  before_action :set_task, only: [:edit, :update, :destroy]

  def create
    @task = @task_list.tasks.build(task_params)
    if @task.save
      redirect_to task_list_path(@task_list)
    else
      render "task_lists/show", status: :unprocessable_entity
    end
  end

  def new
    @new_task = Task.new 
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to task_list_path(@task_list)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to task_list_path(@task_list)
  end

  private

  def set_task_list
    @task_list = TaskList.find(params[:task_list_id])
  end

  def set_task
    @task = @task_list.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :completed)
  end
end
