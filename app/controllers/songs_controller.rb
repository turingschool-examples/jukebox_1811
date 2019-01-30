class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
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
end
