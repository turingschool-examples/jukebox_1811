require 'rails_helper'

RSpec.describe "user adds songs to cart" do
  it "show a message confirming a song was added" do
    artist = Artist.create!(name: "Talking Heads")
    song = artist.songs.create!(title: "Heaven", length: 250, play_count: 13)

    visit songs_path

    within("#song-#{song.id}") do
      click_button "Add Song"
    end

    expect(page).to have_content("You now have 1 copy of #{song.title} in your cart.")
  end

  it "the message correctly increments for multiple songs" do
    artist = Artist.create(name: 'Rick Astley')
    song = artist.songs.create(title: 'Never Gonna Give You Up', length: 250, play_count: 1000000)

    visit songs_path

    click_button "Add Song"

    expect(page).to have_content("You now have 1 copy of #{song.title} in your cart.")

    click_button "Add Song"

    expect(page).to have_content("You now have 2 copies of #{song.title} in your cart.")
  end

  it "shows total number of songs in our cart" do
    artist = Artist.create!(name: "Talking Heads")
    song = artist.songs.create!(title: "Heaven", length: 250, play_count: 13)

    visit songs_path

    expect(page).to have_content("Cart: 0")

    within("#song-#{song.id}") do
      click_button "Add Song"
    end

    expect(page).to have_content("Cart: 1")
  end
end
