require 'rails_helper'

RSpec.describe "user creates a new song under artist-songs" do
  it "can create a new song" do
    artist = Artist.create!(name: "This Must be the Band")
    title = "Psycho Killer"
    length = 345
    play_count = 3

    visit new_artist_song_path(artist)

    # save_and_open_page

    fill_in :song_title, with: title
    fill_in :song_length, with: length
    fill_in :song_play_count, with: play_count

    click_on "Create Song"

    new_song = Song.last

    expect(current_path).to eq(song_path(new_song))
  end
end
