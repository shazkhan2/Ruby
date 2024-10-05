 
class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  def index
    if current_user.admin?
      if @user
        @tasks = @user.tasks
      else
      @tasks = Task.all
      end
    else
    @tasks = current_user.tasks
  end
end

  def new
    @task = Task.new
    render 'form'  
  end

 
  
def create
  @task = Task.new(task_params)
  if @task.save
    redirect_to user_tasks_path(@task.user), notice: "Task was successfully created."
    else
      render "form"
    end
  end



  def edit
    render 'form'  
  end

 

  def update
    if @task.update(task_params)
      redirect_to user_tasks_path(@task.user), notice: "Task was successfully updated."
    else
      render "form"
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
    if current_user.admin?
      @task = Task.find(params[:id])
    else
    @task = current_user.tasks.find(params[:id])
  end
end

def set_user
  @user = User.find(params[:user_id]) if params[:user_id]

end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :status, :user_id)
  end
end
