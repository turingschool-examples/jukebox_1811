require 'rails_helper'

RSpec.describe 'when visitor visits songs show', type: :feature do
  before :each do
    @journey = Artist.create(name: 'Journey')
    @song_1 = @journey.songs.create(title: "Don't Stop Believin'", length: 345, play_count: 13)
    @song_2 = @journey.songs.create(title: "This Must be the Place", length: 13, play_count: 11)
  end
  
  it 'can get there from the index page' do
    visit songs_path

    expect(page).to have_link(@song_1.title)
    click_link(@song_1.title)

    expect(current_path).to eq(song_path(@song_1))
  end

  it 'can see a single song' do
    visit song_path(@song_1)

    within "#song-#{@song_1.id}" do
      expect(page).to have_content(@song_1.title)
      expect(page).to have_content("length: #{@song_1.length}")
      expect(page).to have_content("play count: #{@song_1.play_count}")
    end
    expect(page).to_not have_css("#song-#{@song_2.id}")
    expect(page).to have_no_content(@song_2.title)
    expect(page).to_not have_content("length: #{@song_2.length}")
  end
end
