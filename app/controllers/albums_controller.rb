class AlbumsController < ApplicationController
  def create
    if album_params[:studio] == "true"
      album_params[:studio] = true
    else
      album_params[:studio] = false
    end
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      render :new
    end
  end

  def new
    @band_id = params[:band_id].to_i
    @album = Album.new
    render :new
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def index
    @albums = Album.all
    render :index
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    # album = Album.find(params[:id])
    # album.name = params[:album][:name]
    # if album.save
    #   redirect_to album_url(album)
    # else
    #   render :edit
    # end
  end

  def destroy

  end

  def album_params
    params.require(:album).permit(:title, :year, :studio, :band_id)
  end

end
