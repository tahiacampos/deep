class FlatsController < ApplicationController
  def index
    @flats = Flat.all

    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
      }
    end
  end

  def search
    @flats = Flat.near(params[:query], 20)

    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
      }
    end
  end
  
end