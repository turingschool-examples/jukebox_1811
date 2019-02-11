require 'rails_helper'

RSpec.describe 'user registration form', type: :feature do
  it 'creates and logs in a new user' do
    visit root_path

    click_link 'Register as a User'

    name = 'fuzzy duck'
    fill_in :user_username, with: name
    fill_in :user_password, with: 'password'
    click_button 'Create User'

    newest_user = User.last
    expect(current_path).to eq(user_path(newest_user))

    expect(page).to have_content("Welcome, #{name}!")
    expect(page).to have_link('Log out')
  end
end
