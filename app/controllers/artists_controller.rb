class ArtistsController < ApplicationController

    def index
        @artists = Artist.all
    end

    def show
        @artist = Artist.find(params["id"])
        @songs = Song.where(artist: @artist)
    end
    
    def new
        @artist = Artist.new
    end
    
    def create
        @artist = Artist.new song_params
        if @artist.save
          redirect_to artists_path
        else
          render :new
        end
    end
    
    private
    
    def artist_params
        params.require(:artist).permit(:name, :website, :bio, :location)
    end
end
