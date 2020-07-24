require 'rails_helper'

feature 'Adding a new post', type: :feature do
  feature 'User need to be logged in to add new post' do
    before(:each) do
      User.create(name: 'Tayo', email: 'tayo@mail.com', password: 'password', password_confirmation: 'password')
      visit '/users/sign_in'
      within('#new_user') do
        fill_in 'Email', with: 'tayo@mail.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      fill_in 'post_content', with: 'This is an article.'
      click_button 'commit'
    end

    scenario 'when you create a new post' do
      expect(page).to have_content('Post was successfully created.')
      expect(page).to have_content('SIGN OUT')
    end
  end
end
