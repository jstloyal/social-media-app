require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
  end
end
