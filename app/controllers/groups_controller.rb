class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = session[:user_id]
    @group.user << User.find(session[:user_id])
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

  private

  def group_params
    params.require(:group).permit(:title,:bio,:public)

  end


end
