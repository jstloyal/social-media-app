class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: :User

  # def confirm_friend
  #   self.update_attributes(status: true)
  #   Friendship.create!(friend_id: self.user_id,
  #                   user_id: self.friend_id,
  #                   status: true)
  # end
end
