class AdvertisementsController < ApplicationController
  # Native advertising
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
  end

  def edit
  end
end
