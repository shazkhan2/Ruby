class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:edit, :update, :destroy]
    before_action :authorize_admin!, only: [:destroy]
  
    def destroy
      @user.destroy
      redirect_to admin_dashboard_path, notice: 'User was successfully deleted.'
    end

    def edit
      end

      def update
        if @user.update(user_params)
            redirect_to admin_dashboard_path, notice: "User updated successfully."
            else
                render :edit, alert: "There was an error updating the user."
            end
        end

  
    private
  
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :role)
    end
  
    def authorize_admin!
      redirect_to root_path, alert: 'You are not authorized to perform this action.' unless current_user.admin?
    end
  end
  