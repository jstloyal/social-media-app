module UsersHelper
  def request_button(user)
    return if current_user == user

    if @user_requests.include?(user)
      link_to 'Decline friend request', remove_friend_path(user_id: user.id), method: :delete
      link_to 'Accept friend request', add_friend_path(friend_id: user.id), method: :post
    elsif @friends.include?(user)
      link_to 'Unfriend', remove_friend_path(user_id: user.id), method: :delete
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



# <%= link_to 'See Profile',  user_path(user), class: "btn btn-secondary" %>
#            <% if current_user.friend_invites(user) %>
#             <button class="btn btn-warning"> Pending Invitation </button>
#           <% elsif current_user.receive_invitation(user)%>
#             <%= link_to 'Accept', accept_invite_path(user_id: user.id), class:"btn btn-primary" %>
#             <%= link_to 'Decline', reject_invite_path(user_id: user.id), method: :delete, class:"btn btn-danger" %>
#           <% elsif !current_user.friend?(user) && current_user.id != user.id %>
#             <%= link_to 'Add Friend', send_invite_path(user_id: user.id) , class:"btn btn-success" %>
#             <% elsif current_user.friend?(user) %>
#             <%= link_to 'Remove friend', remove_friend_path(user_id: user.id), method: :delete, data: {confirm: "Are you sure you want to remove friend?"}, class: "btn btn-danger" %>
#           <% end %>