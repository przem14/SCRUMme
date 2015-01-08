require 'rails_helper'

EMAIL = 'user@test.com'
PASSWORD = 'password12'

def create_user
  User.create(:email => EMAIL, :password => PASSWORD)
end

def fill_sign_in_form(email, password)
  fill_in 'Email', :with => email
  fill_in 'Password', :with => password
  click_button 'Log in'
end

def sign_in(email, password)
  visit root_path
  click_link 'Sign in'

  fill_sign_in_form(email, password)
end

feature 'Users', :type => :feature do

  scenario 'User sign in' do
    create_user
    sign_in(EMAIL, PASSWORD)

    expect(page).to have_content('Signed in successfully.')
    expect(page).to_not have_link('Sign in')
    expect(page).to have_content('Signed as ' + EMAIL)
    expect(current_path).to be == root_path
  end

  scenario 'User cannot sign in when not registered' do
    sign_in(EMAIL, PASSWORD)

    expect(page).to have_content('Invalid email or password')
  end

  scenario 'Users cannot sign in when type wrong password' do
    create_user
    sign_in(EMAIL, 'wrong12')

    expect(page).to have_content('Invalid email or password')
    expect(current_path).to be == new_user_session_path
  end

  scenario 'User can sign out' do
    create_user
    sign_in(EMAIL, PASSWORD)

    expect(page).to have_link('Sign out')

    click_link 'Sign out'

    expect(page).to have_content('Signed out successfully.')
    expect(current_path).to be == root_path
  end

  scenario 'User can edit account' do
    create_user
    sign_in(EMAIL, PASSWORD)

    expect(page).to have_link('Edit')

    click_link 'Edit'

    expect(current_path).to be == edit_user_registration_path
  end
end
