
class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  
  def index
    if current_user
      @tasks = current_user.tasks
    else
      @tasks = Task.none
    end
  end
end
