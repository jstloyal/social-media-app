require 'rails_helper'

feature 'Creating new comment', type: :feature do
  feature 'User need to login and fill in comment' do
    before(:each) do
      User.create(name: 'Tayo', email: 'tayo@mail.com', password: 'password', password_confirmation: 'password')
      visit '/users/sign_in'
      within('#new_user') do
        fill_in 'Email', with: 'tayo@mail.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      fill_in 'post_content', with: 'This is a new article.'
      click_button 'commit'
      within('#new_comment') do
        fill_in 'comment_content', with: 'This is a comment.'
        click_button 'commit'
      end
    end

    scenario 'when you create a new post' do
      expect(page).to have_content('Comment was successfully created.')
      expect(page).to have_content('SIGN OUT')
    end
  end
end
