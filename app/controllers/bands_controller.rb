class BandsController < ApplicationController

  def create
    band = Band.new(band_params)

    if band.save
      redirect_to band_url(band)
    else
      render :new
    end
  end

  def new
    @band = Band.new
    render :new
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def index
    @bands = Band.all
    render :index
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    band = Band.find(params[:id])
    band.name = params[:band][:name]
    if band.save
      redirect_to band_url(band)
    else
      render :edit
    end
  end

  def destroy

  end

  def band_params
    params.require(:band).permit(:name)
  end
end
