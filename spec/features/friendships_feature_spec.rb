require 'rails_helper'

feature 'Add new friends', type: :feature do
  feature 'Login an existing user' do
    let(:user1) do
      User.create(name: 'Tayo', email: 'tayo@mail.com', password: 'password', password_confirmation: 'password')
    end
    let(:user2) do
      User.create(name: 'Hassan', email: 'friend@mail.com', password: 'password', password_confirmation: 'password')
    end

    before(:each) do
      user1
      user2
      visit '/users/sign_in'
      within('#new_user') do
        fill_in 'Email', with: 'tayo@mail.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      visit '/users'
    end

    scenario 'allow user to send friend request to new users' do
      expect(page).to have_content('Friend request')
    end

    scenario 'allows users to accept friend requests' do
      Friendship.create(user_id: user2.id, friend_id: user1.id)
      click_button 'Friend request'
      expect(page).to have_content('Request Pending')
    end
  end
end
