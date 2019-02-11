require 'rails_helper'

RSpec.describe 'user logout workflow' do
  it 'logs out the user' do
    user = User.create(username: 'fuzzyduck', password: 'password')

    visit root_path
    click_link 'Log In'
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    click_button 'Log Me In'

    click_link('Log Out')

    expect(current_path).to eq(root_path)

    expect(page).to have_link('Log In')
  end
end
