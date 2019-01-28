require 'rails_helper'

RSpec.describe 'when visitor visits songs index', type: :feature do
  it 'can see all songs' do
    song_1 = Song.create(title: "Don't Stop Believin'", length: 345, play_count: 13)
    song_2 = Song.create(title: "This Must Be the Place", length: 678, play_count: 5)

    visit '/songs'

    expect(page).to have_content("All Songs")
    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_2.title)
    expect(page).to have_content(song_1.length)
    expect(page).to have_content(song_2.length)
    expect(page).to have_content(song_1.play_count)
    expect(page).to have_content(song_2.play_count)
  end
end
