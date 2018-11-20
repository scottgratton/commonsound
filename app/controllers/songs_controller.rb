class SongsController < ApplicationController
  
  def index
      @songs = Song.all
  end
  
  def new
      @song = Song.new
      @artist = Artist.find(params['artist'])
  end
  
  def create
      @song = Song.new song_params
      if @song.save
        redirect_to artist_path(@song.artist)
      else
        render :new
      end
  end
  
  private
  
  def song_params
      params.require(:song).permit(:title, :artist_id, :track, :tag_list)
  end

end
