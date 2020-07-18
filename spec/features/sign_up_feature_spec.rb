require 'rails_helper'

feature 'Sign up feature page', type: :feature do
  feature 'Sign up a new user' do
    before(:each) do
      visit '/users/sign_up'
    end

    scenario 'when you signup with invalid params' do
      fill_in 'Name', with: 'Tayo'
      fill_in 'Email', with: 'tayo@mail.com'
      click_on 'Sign up'
      expect(current_path).to eq('/users')
      expect(page).to have_content("Password can't be blank")
    end

    scenario 'with valid params' do
      fill_in 'Name', with: 'Jagun'
      fill_in 'Email', with: 'jagun@mail.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_on 'Sign up'
      expect(page).to have_content("Jagun")
      expect(page).to have_content("Welcome! You have signed up successfully")
      expect(current_path).to eq("/")
    end
  end
end