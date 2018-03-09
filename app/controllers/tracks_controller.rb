class TracksController < ApplicationController

  def new
    @album_id = params[:album_id].to_i
    render :new
  end

  def index

  end

  def create
    if track_params[:bonus] = "true"
      track_params[:bonus] = true
    else
      track_params[:bonus] = false
    end

    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url(@track)
    else
      render :new
    end
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def edit

  end

  def track_params
    params.require(:track).permit(:title, :ord, :lyrics, :bonus, :album_id)
  end
end
