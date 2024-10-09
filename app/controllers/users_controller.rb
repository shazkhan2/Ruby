class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update, :destroy]
  after_action :verify_authorized

  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to admin_dashboard_path, notice: "User updated successfully."
    else
      render :edit, alert: "There was an error updating the user."
    end
  end

  def destroy
    authorize @user
    @user.destroy
    redirect_to admin_dashboard_path, notice: "User was successfully deleted."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end
end
