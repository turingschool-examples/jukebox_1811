require 'rails_helper'

RSpec.describe 'when visitor visits songs index', type: :feature do
  before :each do
    @journey = Artist.create(name: 'Journey')
    @song_1 = @journey.songs.create(title: "Don't Stop Believin'", length: 345, play_count: 13)
    @song_2 = @journey.songs.create(title: "This Must Be the Place", length: 678, play_count: 5)
  end
  it 'can see all songs' do
    visit songs_path

    expect(page).to have_content("All Songs")

    within "#song-#{@song_1.id}" do
      expect(page).to have_content(@song_1.title)
      expect(page).to have_content("Length: #{@song_1.length}")
      expect(page).to have_content("Play count: #{@song_1.play_count}")
    end
    within "#song-#{@song_2.id}" do
      expect(page).to have_content(@song_2.title)
      expect(page).to have_content("Length: #{@song_2.length}")
      expect(page).to have_content("Play count: #{@song_2.play_count}")
    end
  end
end
