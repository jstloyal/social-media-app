require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'validations' do
    it 'validates presence of user_id' do
      user = Like.new(user_id: 2)
      expect(user.valid?).to be false
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end
