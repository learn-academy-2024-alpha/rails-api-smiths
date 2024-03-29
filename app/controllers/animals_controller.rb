class AnimalsController < ApplicationController
  def index
    animals = Animal.all
    render json: animals
  end

  def show
    animal = Animal.find(params[:id])
    render json: animal, include: :animal_sightings
  end

  def create
    animal = Animal.new(animal_params)
    if animal.save
      render json: animal
    else
      render json: animal.errors, status: :unprocessable_entity
    end
  end

  def update
    animal = Animal.find(params[:id])
    animal.update!(animal_attributes)
    animal.update(animal_params)
    render json: animal
  end

  def destroy
    animal = Animal.find(params[:id])
    animal.destroy
    render json: animal
  end

  private
  def animal_params
    params.require(:animal).permit(:common_name, :scientific_binomial, animal_sightings_attributes: [:latitude, :longitude, :date])
  end
end
