class CreatePlaylistSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :playlist_songs do |t|
      t.references :song, foreign_key: true
      t.references :playlist, foreign_key: true
    end
  end
end
