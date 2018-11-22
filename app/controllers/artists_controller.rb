class ArtistsController < ApplicationController

    def index
        @artists = Artist.all
    end

    def show
        @artist = Artist.find(params['id'])
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

    def edit
        @artist = Artist.find(params['id'])
    end

    def update
        @artist = Artist.find(params['id'])
        if @artist.update_attributes(artist_params) &&
            @artist.image.attach(artist_params[:image])
          flash[:success] = "Artist updated"
          redirect_to @artist
        else
          render 'edit'
        end
      end
    
    private
    
    def artist_params
        params.require(:artist).permit(:name, :website, :bio, :location, :image)
    end
end
