module UsersHelper
  def request_button(user)
    return if current_user == user

    if @user_requests.include?(user)
      link_to 'Accept', add_friend_path(friend_id: user.id), method: :post
    elsif @friends.include?(user)
      link_to 'Unfriend', remove_friend_path(user_id: user.id), method: :delete
    elsif @pending_requests.include?(user)
      link_to 'Request Pending', '#'
    elsif user != current_user
      link_to 'Friend request', friendships_path(friend_id: user.id), method: :post, class: 'btn'
    end
  end

  def decline_button(user)
    return if current_user == user

    return link_to 'Decline', remove_friend_path(user_id: user.id), method: :delete if @user_requests.include?(user)
  end

  def show_button(user)
    return if current_user == user

    link_to 'Friend request', friendships_path(friend_id: user.id), method: :post unless current_user.friend?(user)
  end
end
