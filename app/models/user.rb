class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships
  has_many :inverse_friendships, class_name: :Friendship, foreign_key: :friend_id

  has_many :pending_friendships, -> { where status: false }, class_name: 'Friendship', foreign_key: 'user_id'
  has_many :pending_friends, through: :pending_friendships, source: :friend
  has_many :confirm_friend, -> { where status: true }, class_name: "Friendship"
  has_many :friends, through: :confirm_friend
  has_many :inverse_friendships, -> { where status: false }, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :friend_requests, through: :inverse_friendships, source: :friend

  def confirm_friend(user)
    friendship = Friendship.find { |friend| friend.user == user }
    friendship.status = true
    friendship.save
    reverse_confirmation = friendships.build(friend_id: user.id, status: true)
    reverse_confirmation.save
  end

  def friend?(user)
    friends.include?(user)
  end

  # def friends_and_own_posts
  #   Post.where(user: (self.friends + self))
  # end
end
