class InvitesController < ApplicationController

  def index

    @invites = Invite.all
  end

  def new
    @invite = Invite.new
    if (params.has_key?(:group) ) && (@group = Group.find(params[:group][:group_id]))
    else
      flash[:notice] = "You need to invite a user from a group homepage"
      redirect_to groups_path
    end

  end

  def create
    #Check if there is a user assocaited with the email
    if @user = User.find_by(email: params[:invite][:email] )
    else
      flash[:notice] = "No User with that email found"
      redirect_to group_path(params[:invite][:group_id]) and return
    end

    #Check if the user is already in the specified group
    @group = Group.find(params[:invite][:group_id])
    if @group.users.exists?(@user.id)
      flash[:notice] = "The user is already in the group"
      redirect_to group_path(params[:invite][:group_id]) and return
    end

    #Check if invite for group already exists
    if @existingInvite = Invite.find_by(email: params[:invite][:email], group_id: params[:invite][:group_id])
      flash[:notice] = "An invite for this group already exists for this user"
      redirect_to group_path(params[:invite][:group_id]) and return
    end
    @invites = Invite.all

    #attempt to save invite
    @invite = Invite.new(invite_params)
    @invite.user_id = @user.id
    if @invite.save
      flash[:notice] = "Invite Sent successfully!"
      redirect_to group_path(params[:invite][:group_id])
    else
      flash[:notice] = "Invite failed to send"
      redirect_to group_path(params[:invite][:group_id])
    end

  end

  def destroy
    @invite = Invite.find(params[:id])
    @user = User.find(@invite.user_id)
    if @user.invites.delete(@invite) && @invite.destroy
      flash[:notice] = "Invite Decline!"
      redirect_to groups_path
    else
      flash[:notice] = "Invite failed to be declined"
      redirect_to groups_path
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:email,:group_id,:sender_id)
  end
end
