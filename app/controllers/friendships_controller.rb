class FriendshipsController < ApplicationController
  def create
    if current_user.friend_requests.to_a.include? User.find(params[:friend_id])
      redirect_to users_path and return
    end

    request = current_user.friendships.build(friend_id: params[:friend_id])
    request.status = false
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
    current_user.confirm_friend(User.find(params[:friend_id]))
    flash[:notice] = 'Friend request accepted'
    redirect_to users_path
  end

  private

  def request_params
    params.permit(:friend_id)
  end
end
