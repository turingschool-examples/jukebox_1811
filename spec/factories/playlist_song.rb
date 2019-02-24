FactoryBot.define do
  factory :playlist_song, class: PlaylistSong do
    song
    playlist
  end
end