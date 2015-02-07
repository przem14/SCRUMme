class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_login
    unless user_signed_in?
      flash[:alert] = "You must be logged in"
      redirect_to new_user_session_path
    end
  end

  def require_admin
    unless current_user.admin
      flash[:alert] = "You have no permission to see this content"
      redirect_to root_path
    end
  end
end
