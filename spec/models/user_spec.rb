require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should have_many(:friendships) }
    it { should have_many(:pending_friendships) }
    it { should have_many(:pending_friends) }
    it { should have_many(:confirm_friend) }
    it { should have_many(:friends) }
    it { should have_many(:inverse_friendships) }
    it { should have_many(:friend_requests) }
  end
end
