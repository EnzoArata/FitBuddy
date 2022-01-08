class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created successfully"
      redirect_to @user
    else
      render 'new'
    end

  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
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

end
