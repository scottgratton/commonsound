class AlbumsController < ApplicationController
  def show
  end

  def new
    @album = Album.new
    @artist = Artist.find(params['artist'])
  end

  def create
    @album = Album.new album_params
    if @album.save
      redirect_to edit_artist_path(@album.artist)
    else
      render :new
    end
  end

  def edit
    @album = Album.find(params['id'])
  end

  def update
    @album = Album.find(params['id'])
    if @album.update_attributes(album_params) && attach_image
      flash[:success] = "Album updated"
      redirect_to edit_artist_path(@album.artist)
    else
      render 'edit'
    end
  end

  def delete
  end
end

private

def attach_image
  @album.image.attach(album_params[:image]) if album_params[:image].present?
  true
end

def album_params
  params.require(:album).permit(:title, :artist_id, :image)
end