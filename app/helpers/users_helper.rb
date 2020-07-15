module UsersHelper
  def request_button(user)
    if @user_requests.include?(user)
      link_to 'Accept request', add_friend_path(friend_id: user.id), method: :post, class: "btn" 
      link_to 'Reject request', remove_friend_path(user_id: user.id) , method: :delete, class: "btn" 
    else
      if @pending_requests.include?(user)
        link_to 'Request Pending', '#' 
      elsif current_user.friend?(user)
        link_to 'Unfriend', remove_friend_path(user_id: user.id), method: :delete, class: "btn"
      elsif user != current_user
        link_to 'Friend request', friendships_path(friend_id: user.id) , method: :post, class: "btn"
      end
    end
  end
end