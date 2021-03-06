class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end

  def require_same_user
    if current_user != User.find(params[:id])
      flash[:alert] = "You can only edit your own user record"
      redirect_to user_path(current_user)
    end

  end

  def require_group_owner
    @group = Group.find(params[:id])
    if current_user.id != @group.user_id
      flash[:alert] = "Only the group owner can edit the group"
      redirect_to user_path(current_user)
    end
  end

end
