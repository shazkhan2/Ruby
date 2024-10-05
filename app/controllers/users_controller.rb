class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:destroy]
    before_action :authorize_admin!, only: [:destroy]
  
    def destroy
      @user.destroy
      redirect_to admin_dashboard_path, notice: 'User was successfully deleted.'
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def authorize_admin!
      redirect_to root_path, alert: 'You are not authorized to perform this action.' unless current_user.admin?
    end
  end
  