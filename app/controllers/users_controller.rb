class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created successfully"
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end

  end

  def index
    @users = User.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User Edited successfully"
      redirect_to @user
    else
      render 'edit'
    end

  end

  def updatepassword
    #@user = User.first
    @user = User.find(params[:user][:user_id])
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
