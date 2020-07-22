module UsersHelper
  def request_button(user)
    return if current_user == user

    if @user_requests.include?(user)
      link_to 'Decline friend request', remove_friend_path(user_id: user.id), method: :delete # class: 'btn'
      link_to 'Accept friend request', add_friend_path(friend_id: user.id), method: :post # class: 'btn'
    elsif current_user.friend?(user)
      link_to 'Unfriend', remove_friend_path(user_id: user.id), method: :delete, class: 'btn'
    elsif @pending_requests.include?(user)
      link_to 'Request Pending', '#'
    elsif user != current_user
      link_to 'Friend request', friendships_path(friend_id: user.id), method: :post, class: 'btn'
    end
  end

  def show_button(user)
    link_to 'Friend request', friendships_path(friend_id: user.id), method: :post unless current_user.friend?(user)
  end
end
