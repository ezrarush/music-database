class SpotifyArtistsController < ApplicationController
  def index
    if params[:artist].nil?
      redirect_to :back
    else
      @artists = RSpotify::Artist.search(params[:artist])
    end
  end

  def show
    @artist = RSpotify::Artist.find(params[:id])    
  end
end
