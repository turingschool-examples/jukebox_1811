class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    song = Song.find(params[:song_id])
    song_id_str = song.id.to_s
    @cart.add_song(song_id_str)
    session[:cart] = @cart.contents
    quantity = session[:cart][song_id_str]
    flash[:success] = "You now have #{pluralize(quantity, "copy")} of #{song.title} in your cart."
    redirect_to songs_path
  end
end
