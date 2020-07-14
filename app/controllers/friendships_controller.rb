class FriendshipsController < ApplicationController
  def create
    request = current_user.friendships.build(request_params)
    request.status = false
    request.save

    redirect_to users_path
  end

  def destroy
    request = Friendship.find_by(user_id: params[:user_id], friend_id: current_user.id)
    inverse_invite = Invitation.find_by(user_id: current_user.id, friend_id: params[:user_id])
    delete if request
    delete if inverse_invite
    redirect_to current_user
  end

  private

  def request_params
    params.permit(:friend_id)
  end
end
