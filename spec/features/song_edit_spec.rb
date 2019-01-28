require 'rails_helper'

RSpec.describe 'when visitor visits song edit', type: :feature do
  it 'can edit a song title' do
    song_1 = Song.create(title: "Don't Stop Believin'", length: 345, play_count: 13)
    song_2 = Song.create(title: "This Must be the Place", length: 13, play_count: 11)

    visit "/songs/#{song_1.id}/edit"

    new_title = "Don't Stop Believing"

    fill_in("song[title]", with: new_title)

    click_on("Save")

    expect(current_path).to eq("/songs/#{song_1.id}")

    within("#song-#{song_1.id}") do
      expect(page).to have_content(new_title)
    end
  end
end
