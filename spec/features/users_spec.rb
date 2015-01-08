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

feature 'Users', :type => :feature do
  scenario 'User cannot sign in when not registered' do
    visit root_path
    click_link 'Sign in'

    fill_sign_in_form(EMAIL, PASSWORD)

    expect(page).to have_content('Invalid email or password')
  end

  scenario 'Users cannot sign in when type wrong password' do
    create_user

    visit root_path
    click_link 'Sign in'

    fill_sign_in_form(EMAIL, 'wrong12')

    expect(page).to have_content('Invalid email or password')
  end

  scenario 'User sign in' do
    create_user

    visit root_path
    click_link 'Sign in'

    fill_sign_in_form(EMAIL, PASSWORD)

    expect(page).to have_content('Signed in successfully.')
    expect(page).to_not have_content('Sign in')
    expect(page).to have_content('Signed as ' + EMAIL)
  end
end
