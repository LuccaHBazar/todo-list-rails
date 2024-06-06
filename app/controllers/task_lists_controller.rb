class TaskListsController < ApplicationController
    before_action :set_task_list, only: [:show, :destroy]

    def index
        @task_lists = TaskList.all
        @task_list = TaskList.new
    end

    def show
        @new_task = Task.new
    end

    
    def create
        @task_list = TaskList.new(task_list_params)
        if @task_list.save
            redirect_to "#index"
        else
            render :new, status: :unprocessable_entity 
        end
    end

    def destroy
        @task_list.destroy
        redirect_to "#index"
    end

    private

    def set_task_list
        @task_list = TaskList.find(params[:id])
    end

    def task_list_params
        params.require(:task_list).permit(:name)
    end

end
