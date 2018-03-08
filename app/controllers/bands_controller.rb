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
    @bands = Band.all
    render :show
  end

  def index
    @band = Band.find(params[:id])
    render :index
  end

  def edit
    @band = Band.find(paramsp[:id])
    render :edit
  end

  def destroy

  end
end
