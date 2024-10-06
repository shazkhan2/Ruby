class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin
  
  def index
    @users = User.all
    @tasks = Task.includes(:user).all
end

def check_if_admin
    redirect_to root_path, alert: "You are not authorized to view this content." unless current_user.admin?
end
end
