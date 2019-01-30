class ArtistsController < ApplicationController
  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to "/artists/#{@artist.id}"
    else
      render :new
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end
end
