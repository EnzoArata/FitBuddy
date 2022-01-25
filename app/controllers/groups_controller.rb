class GroupsController < ApplicationController
  before_action :require_user, except: [:show, :index]
  before_action :require_group_owner, only: [:edit]

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = "Group updated successfully"
      redirect_to @group
    else
      render 'edit'
    end

  end

  def index
    @groups = Group.all
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = session[:user_id]
    @group.users << User.find(session[:user_id])
    if @group.save
      flash[:notice] = "Group Created!"
      redirect_to @group

    else
      render 'new'
    end

  end

  def show
    @group = Group.find(params[:id])
    @user = User.find(@group.user_id)
  end

  def joingroup
    @group = Group.find(params[:group][:group_id])
    @user = User.find(session[:user_id])
    if @group.users << @user
      flash[:notice] = "Joined group successfully!"
      redirect_to @group
    else
      flash[:notice] = "Failed to join group"
      render 'index'
    end
  end

  def leavegroup
    @group = Group.find(params[:group][:group_id])
    @user = User.find(session[:user_id])
    if @user == @group.user_id
      flash[:notice] = "Cant leave group because you are the owner"
      redirect_to @group
    end
    if @group.users.delete(@user.id)
      flash[:notice] = "left group successfully!"
      redirect_to groups_path
    else
      flash[:notice] = "Failed to leave group"
      render 'index'
    end

  end

  private

  def group_params
    params.require(:group).permit(:title,:bio,:public)

  end


end
