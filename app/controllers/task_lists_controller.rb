class TaskListsController < ApplicationController
    before_action :set_task_list, only: [:show]

    def index
        @task_lists = TaskList.all
        @task_list = TaskList.new
    end

    def show
    end

    
    def create
        @task_list = TaskList.new(task_list_params)
        if @task_list.save
            redirect_to "#index"
        else
            render :new, status: :unprocessable_entity 
        end
    end

    private

    def set_task_list
        @task_list = TaskList.find(params[:id])
    end

    def task_list_params
        params.require(:task_list).permit(:name)
    end

end
