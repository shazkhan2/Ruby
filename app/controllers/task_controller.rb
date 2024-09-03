# class TasksController < ApplicationController
#     before_action :authenticate_user!  
#     before_action :set_task, only: [:show, :edit, :update, :destroy]


#   def index
#     @tasks = current_user.tasks
#   end
  
#     def new
#       @task = current_user.tasks.build  
#     end
  
#     def create
#       @task = current_user.tasks.build(task_params)  
#       if @task.save
#         redirect_to user_task_path(current_user, @task), notice: 'Task was successfully created.'
#       else
#         render :new
#       end
#     end
  
#     def edit
#     end
  
#     def update
#       if @task.update(task_params)
#         redirect_to @task, notice: 'Task was successfully updated.'
#       else
#         render :edit
#       end
#     end
  
#     def show
#     end
  
#     def destroy
#       @task.destroy
#       redirect_to tasks_path, notice: 'Task has been deleted.'
#     end
  
#     private
  
#     def set_task
#       @task = current_user.tasks.find(params[:id])
#     end
  
#     def task_params
#       params.require(:task).permit(:title, :description, :due_date, :status)
#     end
#   end
  
class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_task, only: [:show, :edit, :update, :destroy]
  
    def index
      @tasks = current_user.tasks
    end
  
    def new
      @task = current_user.tasks.build
    end
  
    def create
      @task = current_user.tasks.build(task_params)
      if @task.save
        redirect_to user_task_path(current_user, @task), notice: 'Task was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @task.update(task_params)
        redirect_to user_task_path(current_user, @task), notice: 'Task was successfully updated.'
      else
        render :edit
      end
    end
  
    def show
    end
  
    def destroy
      @task.destroy
      redirect_to user_tasks_path(current_user), notice: 'Task has been deleted.'
    end
  
    private
  
    def set_task
      @task = current_user.tasks.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:title, :description, :due_date, :status)
    end
  end
  