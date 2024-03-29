class AnimalSightingsController < ApplicationController

  def index
    animal_sightings = AnimalSighting.all
    render json: animal_sightings
  end

  def create
    animal_sighting = AnimalSighting.create(animal_sighting_params)
    render json: animal_sighting
  end

  def update
    animal_sighting = AnimalSighting.find(params[:id])
    animal_sighting.update(animal_sighting_params)
    render json: animal_sighting
  end

  def destroy
    animal_sighting = AnimalSighting.find(params[:id])
    animal_sighting.destroy
    render json: animal_sighting
  end

  private
  def animal_sighting_params
    params.require(:animal_sighting).permit(:latitude, :longitude, :date, :animal_id)
  end
end
