class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: :User

  def confirm_friend
    current_user.update_attributes(status: true)
    Friendship.create!(friend_id: current_user.user_id, user_id: current_user.friend_id, status: true)
  end
end
