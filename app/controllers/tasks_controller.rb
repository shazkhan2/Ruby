 
class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :create]

def index
  @tasks = Task.fetch_tasks(current_user, @user)
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
  @task = Task.find_by(id:params[:id])
  unless @task && (current_user.admin? || @task.user == current_user)
    redirect_to tasks_path, alert: "You are not authorized to view this task."
  end
end


def set_user
  @user = User.find(params[:user_id]) if params[:user_id]

end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :status, :user_id)
  end
end
