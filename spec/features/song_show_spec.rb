require 'rails_helper'

RSpec.describe 'when visitor visits songs show', type: :feature do
  it 'can see a single song' do
    song_1 = Song.create(title: "Don't Stop Believin'", length: 345, play_count: 13)
    song_2 = Song.create(title: "This Must be the Place", length: 13, play_count: 11)

    visit "/songs/#{song_1.id}"

    within("#song-#{song_1.id}") do
      expect(page).to have_content(song_1.title)
      expect(page).to have_content("length: #{song_1.length}")
      expect(page).to have_content("play count: #{song_1.play_count}")
    end
      expect(page).to have_no_content(song_2.title)
      expect(page).to_not have_content("length: #{song_2.length}")
  end
end
