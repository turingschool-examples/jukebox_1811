require 'factory_bot_rails'

include FactoryBot::Syntax::Methods

Song.destroy_all
PlaylistSong.destroy_all
Playlist.destroy_all
Artist.destroy_all


user_1 = create(:user)
admin = create(:admin)

songs = create_list(:song, 5)

artists = Artist.all
songs[3].update(artist: artists[1])
songs[4].update(artist: artists[1])

playlist_1 = create(:playlist, songs: [songs[0], songs[1], songs[2]])
playlist_2 = create(:playlist, songs: [songs[1], songs[2], songs[3]])
playlist_3 = create(:playlist, songs: [songs[2], songs[3], songs[4]])
