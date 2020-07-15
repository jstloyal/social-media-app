class FriendshipsController < ApplicationController
  def create
    request = current_user.friendships.new(request_params)
    request.status = true
    request.save

    redirect_to users_path
  end

  def destroy
    request = Friendship.find_by(user_id: params[:user_id], friend_id: current_user.id)
    inverse_request = Friendship.find_by(user_id: current_user.id, friend_id: params[:user_id])
    request&.delete
    inverse_request&.delete

    redirect_to current_user
  end

  def accept_request
    current_user.confirm_friend(User.find(params[:user_id]))
    flash[:notice] = 'Friend request accepted'
    redirect_to users_path
  end

  private

  def request_params
    params.permit(:friend_id)
  end
end
