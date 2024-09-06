class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  protect_from_forgery  with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    user_tasks_path(current_user)

end
end