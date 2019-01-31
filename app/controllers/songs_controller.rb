class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @song = Song.new
  end

  def create
    artist = Artist.find(params[:artist_id])
    song = artist.songs.new(song_params)
    song.save
    redirect_to song_path(song)
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.title = params[:song][:title]
    @song.length = params[:song][:length]
    @song.play_count = params[:song][:play_count]

    if @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :length, :play_count)
  end
end
