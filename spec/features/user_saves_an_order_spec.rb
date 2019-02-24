require 'rails_helper'

RSpec.describe 'user can save an order' do
  it "creates an order in the database" do
    user = User.create!(username: 'papa smurf', password: 'password', role: 0)
    artist = Artist.create!(name: "Talking Heads")
    song = artist.songs.create!(title: "Heaven", length: 250, play_count: 13)

    visit root_path

    click_link 'Log In'

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_button 'Log Me In'

    visit songs_path

    within("#song-#{song.id}") do
      click_button "Add Song"
    end

    expect(page).to have_content("You now have 1 copy of #{song.title} in your cart.")

    within("#song-#{song.id}") do
      click_button "Add Song"
    end

    click_button "Create Order"

    order = Order.last

    expect(order.user).to eq(user)
    expect(page).to have_content("Cart: 0")
  end
end
