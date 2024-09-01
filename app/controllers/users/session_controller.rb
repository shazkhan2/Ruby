class Users::SessionsController < Devise::SessionsController
    def create
        user = User.find_by(email: params[:user][:email])
            if user && user.valid_password?(params[:user][:password])
            sign_in(:user, user)
            redirect_to root_path, notice: 'Logged in successfully'
        else
            flash.now[:alert] = 'Incorrect email or password'
            render :new
            end
  end
  def destroy
    sign_out(:user)
    redirect_to root_path, notice: 'You have logged out'
  end
end
