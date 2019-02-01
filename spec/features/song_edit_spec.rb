require 'rails_helper'

RSpec.describe 'when visitor visits song edit', type: :feature do
  before :each do
    @journey = Artist.create(name: 'Journey')
    @song_1 = @journey.songs.create(title: "Don't Stop Believin'", length: 345, play_count: 13)
  end
  it 'can edit a song title' do
    new_title = "Don't Stop Believing"

    visit edit_artist_song_path(@journey, @song_1)

    fill_in "song[title]", with: new_title
    click_button 'Update Song'

    expect(current_path).to eq(song_path(@song_1))

    within("#song-#{@song_1.id}") do
      expect(page).to have_content(new_title)
    end
  end

  it 'cannot edit a song title without a song title or length' do
    @song_1 = @journey.songs.create(title: "Don't Stop Believin'", length: 345, play_count: 13)

    visit edit_artist_song_path(@journey, @song_1)

    # set these fields to empty strings
    fill_in "song[title]", with: ""
    fill_in "song[length]", with: ""
    click_button "Update Song"

    # because we're doing a 'render' in our songs_controller and not a redirect,
    # the route we're on here is still the PUT path of /songs/:id
    # so this part of the test is still valid
    expect(current_path).to eq(artist_song_path(@journey, @song_1))

    # expect to see the form again
    expect(page).to have_field('song[title]')
    # expect to see an error message
    within '#errors' do
      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Length is not a number")
      expect(page).to have_content("Length can't be blank")
    end
  end
end
